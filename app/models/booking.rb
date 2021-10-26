class Booking < ApplicationRecord
    belongs_to :room #, inverse_of: :bookings
    belongs_to :user #, inverse_of: :bookings

    validates :guests,:check_in,:check_out, presence: true
    validate :out_date_after_in_date
    validates :check_in, :check_out, overlap: {:scope => "room_id", :message_title => "Availablity:", :message_content => "Room is not available"}
    
    def out_date_after_in_date
        return if check_in.blank? || check_out.blank?
        if check_out < check_in
          errors.add(:check_out, "must be after the check In date")
        end
     end

     def room_available?
      Reservation.where(:room_id => @room.id, :arrival => @arrival, :departure => @departure).exists?
    end
  
end
                                                                                                                                                                                                            