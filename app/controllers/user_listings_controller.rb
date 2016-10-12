class UserListingsController < ApplicationController
  def create
    # byebug
    @listing = Listing.find(params["listing_id"])
    if @listing.request!(current_user.id)
      redirect_to @listing
    end
  end

  def approve
    @listing = Listing.find(params["id"])
    @requester_id = params["requester_id"]
    @requester = User.find(@requester_id)
    if @listing.approve!(@requester)
      redirect_to @listing
    end
  end
end
