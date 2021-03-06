class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show]
  

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show

  end

  # GET /listings/new
  def new
    @listing = Listing.new
    4.times {@listing.photos.build}
    
  end

  def house_num

  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    if user_signed_in?
      @listing.user_id = current_user.id
    end


    respond_to do |format|
      if @listing.save

        params['listing']['photos_attributes'].each do |i|

        #photo_params = listing_params['photos_attributes'][i]['image'] rescue nil
        photo_params = i[1]['image']
        #binding.pry
        @photo = Photo.create(image: photo_params, listing_id: @listing.id)
        
        end
        if @photo.save
          format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
          format.json { render :show, status: :created, location: @listing }
        else
          format.html { render :new }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        
        
        end
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:house_num, :address, :price, :description, :details, :user_id, photos_attributes: [:image, :listing_id])
    end
end
