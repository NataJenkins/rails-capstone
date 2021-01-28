class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created'
      redirect_to @category
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
