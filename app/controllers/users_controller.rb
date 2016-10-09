class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_activity = UserActivity.where(user_id: params[:id])
    @listing = Listing.where(user_id: params[:id])
  end
end
