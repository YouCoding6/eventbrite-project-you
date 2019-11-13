class EventsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  

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
      flash[:success] = "Event was successfully created."
			redirect_to event_path(@event.id)
		else
      flash.now[:error] = @event.errors.full_messages.to_sentence
			render new_event_path
		end
	end	

  def destroy

    @event= Event.find_by(id:params[:id])

    if @event.destroy
      flash[:notice] = "Evenement supprimé avec succès"
      redirect_to root_path
    end

  end

  def edit
      @event = Event.find(params[:id])
  end

  def update
    eventparams = params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
    @event = Event.find(params[:id])
    if @event.update(eventparams)
      flash[:notice] = "Evenement édité avec succès"
      redirect_to root_path
    else
      flash[:notice] = "L'évenement n'a pas été édité"
      render :edit
    end
  end


  private

  def is_admin
    @event = Event.find(params[:id])
    if current_user != @event.admin
      flash[:error] = "Vous n'êtes pas le créateur de cet évenement !"
      redirect_to event_path(@event.id)
    end
  end
   
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :price, :description, :location)
  end  

  def count
    Event.find(params[:id]).participants.all.count
  end

end
