class CategoriesController < ApplicationController
  before_action :authenticate_user

  def index
    @categories = Category.all
    @voted_article = Article.includes([:avatar_attachment]).get_most_votes
  end

  def new
    @category = Category.new
    @articles = Article.all.map { |a| [a.title, a.id] }
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
    @category = Category.includes(:articles).find(params[:id])
    @articles = @category.articles
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'Category was successfully deleted.'
    else
      flash[:error] = 'error'
    end
    redirect_to root_url
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def article_params
    params.require(:article).permit(:title, :content, :avatar)
  end
end
