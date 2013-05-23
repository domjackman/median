class Category < ActiveRecord::Base
  attr_accessible :title, :image

  has_many :posts

  has_attached_file :image, styles: {
  	large: "500x500#",
  	medium: "200x200#",
  	thumbnail: "50x50#"
  }

  validates :title, presence: true, uniqueness: true
  validates :image, attachment_presence: true


end
