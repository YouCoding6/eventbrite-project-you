class ChargesController < ApplicationController
	def new
  end

  def create
  # Amount in cents
  @amount = Event.find(params[:event_id]).price * 100

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })

  

    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(participant: current_user,stripe_customer_id: params[:stripeToken], event_id: @event.id)
  
    if @attendance.save
      flash[:notice] = "Vous êtes bien inscrit à cet évenement "
      redirect_to event_path(:id => @event.id)
      
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash.now[:notice] = "Erreur, votre paiement à été anulé"
      redirect_to root_path
      render :action => 'new'
    end 
    
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path


    end

end
