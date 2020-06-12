class Post < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'

	enum status: { draft: 0, published: 1 }
	
	has_many :favorites, dependent: :destroy
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
