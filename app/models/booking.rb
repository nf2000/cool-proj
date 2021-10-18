class Booking < ApplicationRecord
    belongs_to :room #, inverse_of: :bookings
    belongs_to :user #, inverse_of: :bookings

    validates :guests, presence: true

end
                                                                                                                                                                                                            