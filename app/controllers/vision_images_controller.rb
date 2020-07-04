class VisionImagesController < ApplicationController
	def create
		@vision_image = VisionImage.new(vision_images_params)
		@vision_image.save
		tags = Vision.get_image_data(@vision_image.image)
		tags.each do |tag|
			@vision_image.tags.create(name: tag)
		end
		redirect_to vision_images_path
	end
	def index
		@vision_image = VisionImage.new
		@vision_images = VisionImage.order(created_at: "DESC")
	end

	private
	def vision_images_params
		params.require(:vision_image).permit(:image)
	end
end
