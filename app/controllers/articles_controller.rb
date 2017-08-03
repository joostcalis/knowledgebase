class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(permitted_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    access_level = {access_level: params[:article][:access_level].to_i}
    if @article.update(permitted_params.merge(access_level))
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

    def find_article
      @article = Article.friendly.find(params[:id])
    end

    def permitted_params
      params.require(:article).permit(:title, :content, tag_ids: [], category_ids: [])
    end

end
