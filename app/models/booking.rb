class Booking < ApplicationRecord
    belongs_to :room #, inverse_of: :bookings
    belongs_to :user #, inverse_of: :bookings

    validates :guests,:check_in,:check_out, presence: true
    validate :out_date_after_in_date

    duration = [:check_in..:check_out]
    validates_uniqueness_of :room_id, scope: (duration)
    #validates_uniqueness_of :room_id, scope: [:check_out]

    def out_date_after_in_date
        return if check_in.blank? || check_out.blank?
    
        if check_out < check_in
          errors.add(:check_out, "must be after the check In date")
        end
     end

end
                                                                                                                                                                                                            