class PostHashtag < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :hashtag, optional: true
  validates  :post_id, presence: true
  validates  :hashtag_id,   presence: true
end