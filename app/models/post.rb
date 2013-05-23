class Post < ActiveRecord::Base
 	attr_accessible :title, :is_featured, :body, :category_id, :image, :user_id, :tag_list, :url


 	belongs_to :category
 	belongs_to :user

 	has_many :likes
	has_many :comments 	

	has_many :liked_users, through: :likes, source: :user


	scope :featured, where(is_featured: true).order("created_at desc")
	scope :not_featured, where(is_featured: false).order("created_at desc")

	has_attached_file :image, styles:{
		large: "960x320#",
		medium: "200x100#",
		thumbnail: "50x50#"
	}

	acts_as_taggable

#nice URL 

	acts_as_url :title

	def to_param
		url
	end

	def self.search(query)
		where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
	end

end