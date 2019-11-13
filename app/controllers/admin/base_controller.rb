class Admin::BaseController < ApplicationController
	before_action :authenticate_user!, :check_if_admin?
	def index
	   @users = User.all
	   @events = Event.all	
	end
end
