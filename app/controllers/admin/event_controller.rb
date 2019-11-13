class Admin::EventController < ApplicationController
	before_action :authenticate_user! 

end
