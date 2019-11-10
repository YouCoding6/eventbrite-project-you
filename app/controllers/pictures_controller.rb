class PicturesController < ApplicationController
	before_action :is_admin, only: [:create]
    def create
       @event = Event.find(params[:event_id])
       @event.event_picture.attach(params[:event_picture])
       redirect_to(event_path(@event.id))
     end

     def is_admin
  	    @event = Event.find(params[:event_id])
  	      if current_user != @event.admin
  		   flash[:error] = "Vous n'êtes pas le créateur de cet évenement !"
  		   redirect_to event_path(@event.id)
  	      end
      end
end
