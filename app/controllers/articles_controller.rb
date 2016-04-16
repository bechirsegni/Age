class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @articles = Article.where(category: @category_id)
     else
      query = params[:query].presence || "*"
      @articles = Article.search(query).results
     end
  end


  def show
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save!
      redirect_to @article, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Post was successfully destroyed.'
  end

  private
  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :published,
                                    :user_id, :category_id,:image,:article_type,:tag_list,:slug )
  end

  def correct_user
    unless @article.user_id == current_user.id
      redirect_to articles_path, notice: "Not authorized to edit this Article"
      #you must return false to halt
      false
    end
  end

end