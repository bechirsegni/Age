class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :published,   -> { where(Article.published? = true) }
  scope :unpublished, -> { where(Article.published? = false) }

end
