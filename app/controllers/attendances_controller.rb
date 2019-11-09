class AttendancesController < ApplicationController
  before_action :is_admin, only: [:index]

	def new
    @amount = Event.find(params[:event_id]).price 
    @event_name = Event.find(params[:event_id]).title
  end

	def create
	end


	def index
	  @event = Event.find(params[:event_id])
	end

   private

  def is_admin
  	@event = Event.find(params[:event_id])
  	if current_user != @event.admin
  		flash[:error] = "Vous n'êtes pas le créateur de cet évenement !"
  		redirect_to event_path(@event.id)
  	end
  end

end
