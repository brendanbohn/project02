class EventsController < ApplicationController

	def new
		@event = Event.new
		render :new
	end

	def create
		# @group = Group.find(params[:id])
		event_params = params.require(:event).permit(:title, :description, :date, :group_id)
		@event = Event.create(event_params)
		redirect_to root_path
	end

end
