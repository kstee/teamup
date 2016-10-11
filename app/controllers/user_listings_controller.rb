class UserListingsController < ApplicationController
  def create
    # byebug
    @listing = Listing.find(params["listing_id"])
    if @listing.request!(current_user.id)
      # byebug
      Notification.create(recipient: @listing.user, actor: current_user, action: "sent", notifiable: @listing)
      redirect_to @listing
    end
  end

  def approve
    @listing = Listing.find(params["listing_id"])
    @requester_id = params["requester_id"]
    @requester = User.find(@requester_id)
    if @listing.approve!(@requester)
      Notification.create(recipient: @requester, actor: current_user, action: "accepted", notifiable: @listing)
    end
  end
end
