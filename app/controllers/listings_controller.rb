class ListingsController < ApplicationController

  def index
    @listings = Listing.where(status: 0)
    @activity_ids = params["activity_ids"]
    @activities = Activity.all
    @listings = @listings.activity_id(@activity_ids) if @activity_ids.present?
    @locations = ['Kuala Lumpur', 'Selangor', 'Penang', 'Johor', 'Melaka', 'Seremban', 'Pahang']
  end

  def sort
    sort_field = params[:sort_order]
    @listings = Listing.where(status: 0).order("date #{sort_field}")

    #need activity ids here still!!
    @activities = Activity.all
    render :index
  end

  def search
    @locations = ['Kuala Lumpur', 'Selangor', 'Penang', 'Johor', 'Melaka', 'Seremban', 'Pahang']
    @activities = Activity.all #to view all activity types

    @activity_ids = params["activity_ids"]
    filter = { "activity_id" => @activity_ids }

    result = params[:description]
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
        respond_to do |format|
          format.html { render :index }
          format.js {}
        end
      else
        respond_to do |format|
          format.html { render :index }
          format.js   {}
        end
      end
    # end
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
    @requesters = @listing.user_listing.where(isApproved: false)
  end

  def new
    @activity_id = params["activity_id"]
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    @listing.date = DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    @listing.starttime = DateTime.new(params[:starttime][:year].to_i, params[:starttime][:month].to_i, params[:starttime][:day].to_i, params[:starttime][:hour].to_i, params[:starttime][:minute].to_i)
    @listing.endtime = DateTime.new(params[:endtime][:year].to_i, params[:endtime][:month].to_i, params[:endtime][:day].to_i, params[:endtime][:hour].to_i, params[:endtime][:minute].to_i)
    
    if @listing.save
      redirect_to @listing
    else
      redirect_to new_listing_path
    end 
  end

  private

  def listing_params
    params.require(:listing).permit(:description, :date, :starttime, :endtime, :raw_address,
     :latitude, :pax_existing, :pax_needed, :status, :activity_id)
  end
end
