class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:success] = 'New article created'
      redirect_to @article
    else
      flash[:error] = 'Error'
      render 'new'
    end
  end

  def destroy
    
  end

  def show
    @article = article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
