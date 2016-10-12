class UserListingsController < ApplicationController
  def create
    # byebug
    @listing = Listing.find(params["listing_id"])
    if @listing.request!(current_user.id)
      redirect_to @listing
    end
  end
end
