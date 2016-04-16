class Article < ApplicationRecord
  has_attached_file :image, styles: {large:"1016x469>",
                                     big_feauture: "677x677#",
                                     med_home: "677x338#",
                                     small_home: "338x338#",
                                     article: "882x395#" ,
                                      all_article: "318x522#"},
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged

  searchkick text_start: [:title], suggest: [:title] , searchable: [:title, :tag_list], autocomplete: ['title']
  scope :search_import, -> { includes(:category) }

  def search_data
    {
        title: title,
        description: description,
        tag_list: tag_list,
        image: image,
        category_id: category_id,
        category: category,
    }
  end

  belongs_to :user
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
