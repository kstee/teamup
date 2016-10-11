class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    @activity_ids = params["activity_ids"]
    @activities = Activity.all
    @listings = @listings.activity_id(@activity_ids) if @activity_ids.present?
  end

  def search
    @activities = Activity.all #to view all activity types

    @activity_ids = params["activity_ids"]
    filter = { "activity_id" => @activity_ids }

    result = params[:description]
    # byebug
    # if result.blank?
     if result.empty?
      # result = Listing.all
      @listings = Listing.search("*", where: filter)
      # @listings = Listing.all.activity_id(@activity_ids) if @activity_ids.present?
      # @listings = []
      # flash.now[:danger] = "please type in something"
      # render :index
      else
        @listings = Listing.search(result, where: filter)
      end

      if @listings.blank?
        flash.now[:danger] = "no successful search result"
        render :index
      else
        render :index
      end
    # end
  end

  def filter
    byebug
    #render :index
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
    params.require(:listing).permit(:description, :listing_datetime, :raw_address,
     :latitude, :pax_existing, :pax_needed, :status, :activity_id)
  end
end
