module StaticPagesHelper

  def videos
    Video.all.limit(4).order(id: :desc)
  end

end
