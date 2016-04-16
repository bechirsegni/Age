module ArticlesHelper

  def articles
    Article.all
  end

  def article_types
    ["rectangle", "interview", "quote", "link" , "tall", "gallery"]
  end

  def category_name
    @category = Category.find_by(name: params[:category])
    @category.name
  end

end
