class User < ApplicationRecord
    validates :firstname, :surname, :email, :password, :password_confirmation, presence: true
    validates :password, confirmation: true

    validates :firstname, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }

    validates :email, uniqueness: { message: " already has an account with it" }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    has_secure_password

    has_many :bookings
end
