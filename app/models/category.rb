class Category < ApplicationRecord
  has_many :articles
  has_many :videos
end
