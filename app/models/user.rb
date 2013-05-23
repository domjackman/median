class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :username, :avatar, :password, :avatar, :bio

  has_many :posts
  has_many :liked_posts, through: :likes, source: :post
  has_many :likes
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_attached_file :avatar, styles: {
  	medium: "150x150#",
  	thumbnail: "50x50#"
  }

  #nicer URLs

	def to_param
		username
	end

  def likes_post?(post)
    likes.find_by_post_id(post.id)
  end

  def self.search(query)
    where("username LIKE ? OR name LIKE ?", "%#{query}%", "%#{query}%")
  end

end
