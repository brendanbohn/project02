class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		event_params = params.require(:event).permit(:title, :description, :date, :group_id)
		@event = Event.new(event_params)
	end

end
