class UsersController < ApplicationController
  before_action :authenticate_user!,:right_user
  	
    def show
  	
  		@user = User.find(params[:id])
    	@events = []
    	Event.where(admin_id: @user.id).find_each do |event|
    	@events << event
    	end
  	end
  

    private

    def right_user
      unless current_user == User.find(params[:id])
        redirect_to new_user_session_path
      end
    end
end
