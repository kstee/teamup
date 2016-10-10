class ListingsController < ApplicationController

  def index
    #byebug
    @listings = Listing.all
    @activity_ids = params["activity_ids"]
    # byebug
    @listings = @listings.activity_id(@activity_ids) if @activity_ids.present?
  end

  def search
    filter = { "activity_id" => params[:activity_id].split }

    if params[:description].blank?
      render :index
    else
      @listings = Listing.search(params[:description], where: filter)

      if @listings.blank?
        flash[:danger] = "no successful search result"
        render :index 
      else
        render :index
      end
    end

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to @listing 
    else
      render 'edit'
    end
  end 

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listings_path
  end 

  def show
    @listing = Listing.find(params[:id])
    @user_listing = UserListing.new
    @teammates = @listing.user_listing.where(isApproved: true)
  end

  def new
    @activity_id = params["activity_id"]
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing
    else
      redirect_to new_listing_path
    end 
  end

  private

  def listing_params
    params.require(:listing).permit(:description, :listing_datetime, :address,
     :latitude, :pax_existing, :pax_needed, :status, :activity_id)
  end
end
