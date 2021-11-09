class Booking < ApplicationRecord
    belongs_to :room #, inverse_of: :bookings
    belongs_to :user #, inverse_of: :bookings

    validates :guests,:check_in,:check_out, presence: true
    validate :out_date_after_in_date
    validate :capacity
    validate :cannot_be_past_date
    validates :check_in, :check_out, overlap: {:scope => "room_id", :message_title => "Availablity:", :message_content => "Room is not available"}
    
    def out_date_after_in_date
        return if check_in.blank? || check_out.blank?
        if check_out < check_in
          errors.add(:check_out, "must be after the check In date")
        end
     end

    def capacity
      return if guests.blank?
      if guests > room.capacity 
        errors.add(:guests, "number must not exceed the capacity of the room")
      elsif guests == 0 
          errors.add(:guests, "Guests must be more than 0")
      end
    end
     

    def cannot_be_past_date
      return if check_in.blank? || check_out.blank?
      if check_in < Date.current || check_out < Date.current
        errors.add( :check_in, :check_out , message: "date cannot be past date")
      end
    end

end
                                                                                                                                                                                                            