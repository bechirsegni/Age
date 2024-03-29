class Video < ApplicationRecord
  has_attached_file :thumb, styles: {large:"1016x469>", medium: "452x452#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: :slugged
end
