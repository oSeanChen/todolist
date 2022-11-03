class TasksController < ApplicationController
  before_action :find_task, only:[:edit, :update, :destroy]
  before_action :find_category, only: [:update, :destroy]

  def index
    @category = current_user.categories.find(params[:category_id])
    @tasks = @category.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.new(task_params)
    if @task.save
      redirect_to category_tasks_path(@category), notice: "Create succeed"
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_tasks_path(@category), notice:"Update succeed!!"
    else
      render :edit
    end
  end


  def destroy
    @task.destroy
    redirect_to category_tasks_path(@category), notice:"Task was successfully destroyed"
  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :state, :position)
  end

  def find_category
    @category = current_user.categories.find(@task.category_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
