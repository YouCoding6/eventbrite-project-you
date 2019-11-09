class Attendance < ApplicationRecord
	after_create :welcome_send
	belongs_to :participant, class_name: "User"
	belongs_to :event
	

  	def welcome_send
    	UserMailer.attend_welcome_email(self).deliver_now
  	end

end
