class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.order(id: :desc).limit(12)
    @sports   = Article.where(Category.name == 'Sports').order(id: :desc).limit(4)
  end

  def about
  end

  def terms
  end

end