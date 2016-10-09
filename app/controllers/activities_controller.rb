class ActivitiesController < ApplicationController

	def index
		@activities = Activity.all
	end

  def create
    @activities = Activity.all
    render 'create'
  end

  def join
    @activities = Activity.all
    render 'join'
  end

end
