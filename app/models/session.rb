class Session < ApplicationRecord

    validates :email, :password, presence: true
    
    validates :password, length: { in: 6..20 }
    
    validates :email, uniqueness: {case_sensitive: false}
    validates :email, format: /@/
    

end
