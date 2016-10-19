class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_activity = UserActivity.where(user_id: params[:id])
    @listing = Listing.where(user_id: params[:id])
    @joined = UserListing.where(user_id: params[:id])
    @badminton = Activity.find(2)
    @board = Activity.find(6)
    @futsal = Activity.find(1)
  end
end

