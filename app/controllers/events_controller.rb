class EventsController < ApplicationController

	def new
		@event = Event.new
		render :new
	end

	def create
		# @group = Group.find(params[:id])
		event_params = params.require(:event).permit(:title, :description, :date, :group_id)
		@event = Event.new(event_params)
		# CHANGE THIS TO REDIRECT BACK TO THE GROUP PAGE
		redirect_to root_path
	end

end
