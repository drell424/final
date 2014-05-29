class PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :edit, :update, :destroy]

	def new
    @photo = Photo.new
    end

    def show
    end


	def create
    @photo = Photo.create(photo_params)
    @photo.listing = @listing
    end

  def create
    
    @photo = Photo.new(photo_params)
    # @listing.photos.build
   

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }

      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :listing_id)
    end
end