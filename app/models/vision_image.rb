class VisionImage < ApplicationRecord
	attachment :image
	has_many :tags, dependent: :destroy
end
