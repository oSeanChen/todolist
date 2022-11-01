# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update show destroy]
  before_action :authenticate_user!
  def index
    @categories = Category.order(id: :desc)
    @categories = Category.where('title like ?', "%#{params[:keyword]}%").order(id: :desc) if params[:keyword]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Create succeed!!'
    else
      render :new
    end
  end

  def show
    @tasks = Task.all
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Update succeed!!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed'
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title).merge(user: current_user)
  end
end
