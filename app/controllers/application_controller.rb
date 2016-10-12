class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
	end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :gender, {photos:[]}, {photos_urls:[]}])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :gender, {photos:[]}])
  end
end
