class Hashtag < ApplicationRecord
	validates :hashname, presence: true, length: {maximum:99}
	has_many :post_hashtag, optional: true
	has_many :posts, through: :post_hashtag
end
