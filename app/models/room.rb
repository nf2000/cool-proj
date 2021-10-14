class Room < ApplicationRecord
    #belongs_to :Hotel
    has_many :bookings, dependent: :destroy

end
