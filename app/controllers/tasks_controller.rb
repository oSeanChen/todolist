class TasksController < ApplicationController
  before_action :find_category, only: [:create]

  def new
    @task = Task.new
  end

  def create
    @task = @category.tasks.new(task_params)
    if @task.save
      redirect_to category_path(@category), notice: "Create succeed"
    else
      render :new
    end
  end
  

  private
  def task_params
    params.require(:task).permit(:title, :content, :state, :position)
  end
  def find_category
    @category = current_user.categories.find(params[:category_id])
  end
end
