class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new # Needed to instantiate the form_with
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # No need for app/views/articles/create.html.erb
    redirect_to article_path(@article)
  end

  def update
    @article.update(article_params)
    # No need for app/views/articles/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    # No need for app/views/articles/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :address, :rating)
  end
end
