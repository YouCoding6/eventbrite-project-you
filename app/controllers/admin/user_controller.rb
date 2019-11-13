class Admin::UserController < ApplicationController
	before_action :authenticate_user! 

	def edit
		@user = User.find(params[:id])
	end

    def update
     	@user = User.find(params[:id])
        if @user.update
        	redirect_to admin_root_path
        else
        	render 'edit'
        end
    end

	def destroy
    	@user = User.find(params[:id]) 
    	@user.destroy
    	redirect_to admin_root_path
  	end

  
end
