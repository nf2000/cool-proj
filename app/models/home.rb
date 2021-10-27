class Home < ApplicationRecord

    validates :check_in,:check_out, presence: true
    validate :out_date_after_in_date
    
    def out_date_after_in_date
        return if check_in.blank? || check_out.blank?
        if check_out < check_in
          errors.add(:check_out, "must be after the check In date")
        end
     end
end
