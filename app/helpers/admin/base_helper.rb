module Admin::BaseHelper
		def check_if_admin?
    		if current_user.is_admin
    		else
      		  redirect_to root_path
      		  flash[:danger] = "You are not an admin"
    	    end
      end
end
