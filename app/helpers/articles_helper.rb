module ArticlesHelper

  def articles
    Article.all
  end

  def article_types
    ["rectangle", "interview", "quote", "link" , "tall", "gallery"]
  end
end
