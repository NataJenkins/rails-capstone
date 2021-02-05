class ArticlesController < ApplicationController
  before_action :authenticate_user

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @article = current_user.articles.new(article_params)
    @categories = Category.all.map { |c| [c.name, c.id] }
    if @article.save
      @article.categories << Category.find_by(id: params[:categories])
      flash[:success] = 'New article created'
      redirect_to @article
    else
      flash[:error] = 'Error'
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
    else
      flash[:error] = 'error'
      redirect_to root_url
    end
  end

  def show
    @article = Article.includes(:votes).find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :avatar)
  end
end
