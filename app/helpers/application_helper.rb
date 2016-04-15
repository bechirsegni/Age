module ApplicationHelper

  def full_title(page_title="")
    base_tile="The other Side of the news"
    if page_title.blank?
      base_tile
    else
      "#{page_title} | #{base_tile}"
    end
  end
end
