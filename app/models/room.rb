class Room < ApplicationRecord
    has_many :bookings, dependent: :destroy

    def is_empty?
        if bookings.any?
            return false
        else
            return true
        end
    end
      
end
