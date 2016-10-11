class UserListingsController < ApplicationController
  def create
    # byebug
    @listing = Listing.find(params["listing_id"])
    if @listing.request!(current_user.id)
      Notification.create(recipient: @listing.user, actor: current_user, action: "sent", notifiable: @listing)
      redirect_to @listing
    end
  end
end
