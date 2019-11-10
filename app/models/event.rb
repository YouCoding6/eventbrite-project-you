class Event < ApplicationRecord
	belongs_to :admin, class_name: "User"
	has_many :attendances
  has_many :participants, through: :attendances
  has_one_attached :event_picture

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration,
  presence: true,
  :numericality => {:greater_than => 0}
  validate :duration_must_be_a_multiple_of_five
  validates :title,
  presence: true,
	length: { minimum: 5, maximum:140 }
	validates :description,
	presence: true,
	length: { minimum: 20, maximum:1000 }
	validates :price,
	presence: true,
	length: { minimum: 1, maximum:1000 }
	validates :location,
	presence: true

	def start_date_cannot_be_in_the_past
    	if start_date < Date.today
      		errors.add(:start_date, "can't be in the past")
    	end
  	end

  	def duration_must_be_a_multiple_of_five 
        if !(duration % 5 == 0)
        	errors.add(:duration, "must be a multiple of 5")
        end    
  	end 


end
