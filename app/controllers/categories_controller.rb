class CategoriesController < ApplicationController
def index
    @categories = Category.order(id: :desc)
    @categories = Category.where("title like ?", "%#{params[:keyword]}%").order(id: :desc) if params[:keyword]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "create succeed!!"
    else
      render :new
    end

  end
  
  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice:"update succeed!!"
    else
      render :edit
    end

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice:"Category was successfully destroyed"

  end


  private
  def category_params
    params.require(:category).permit(:title)
  end
end

