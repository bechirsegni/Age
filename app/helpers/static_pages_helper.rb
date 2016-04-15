module StaticPagesHelper

  def videos
    Video.all.limit(4).order(id: :desc)
  end

  def feature_articles
    Article.all.limit(4).order(id: :desc)
  end

  def home_articles

  end
end
