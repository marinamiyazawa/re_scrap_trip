class Post < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'

	enum status:{ draft: 0, published: 1 }
	has_many :favorites, dependent: :destroy
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	has_many :post_hashtag, dependent: :destroy
	has_many :hashtags, through: :post_hashtag
	belongs_to :genre, optional: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	after_create do
		post = Post.find_by(id: self.id)
		hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
			#ハッシュタグは先頭の'#'を外した上で保存
			tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
			PostHashtag.create(post_id: post.id, hashtag_id: tag.id)
		end
	end

	before_update do
    	PostHashtag.where(post_id: self.id).destroy_all
		hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
			PostHashtag.create(post_id: self.id, hashtag_id: tag.id)
		end
	end

end
