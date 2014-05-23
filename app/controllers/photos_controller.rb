class PhotosController < ApplicationController

	def new
    @photo = Photo.new
    end



	def create
    @photo = Photo.create(photo_params)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_photo
    #   @photo = Photo.find(params[:id])
    # end

    Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :listing_id)
    end
end