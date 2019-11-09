module ApplicationHelper
	    def attending_event?
    		Event.find(params['id']).participants.ids
    	end 
    	def is_event_admin?(admin)
    		current_user.id == admin.id
    	end
end
