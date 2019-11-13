module ApplicationHelper
	    def attending_event?
    		Event.find(params['id']).participants.ids
    	end 
    	def is_event_admin?(admin)
    		current_user.id == admin.id
    	end
    	def bootstrap_class_for_flash(type)
  			case type
    			when 'notice' then "alert-info"
    			when 'success' then "alert-success"
    			when 'error' then "alert-danger"
    			when 'alert' then "alert-warning"
  			end
		end
    
end
