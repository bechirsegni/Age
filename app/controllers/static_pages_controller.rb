class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.order(id: :desc).limit(8)
  end

  def about
  end

  def terms
  end

end