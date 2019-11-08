class EventsController < ApplicationController
  def index
  	@events = Event.all
  end
  def show
     @event = Event.find(params[:id])

  end

  def new
  	@event = Event.new	
  end

  def create
		@event = Event.new(event_params)
        @event.admin_id = current_user.id
		if @event.save
			redirect_to event_path(@event.id)
		else
			render new_event_path
		end
	end	

  
     def event_params
        params.require(:event).permit(:start_date, :duration, :title, :price, :description, :location)
     end  
end
