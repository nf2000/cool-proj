# This will guess the User class
FactoryBot.define do
    factory :booking do 
      guests { 2 }
      check_in  { "2024-01-01"}
      check_out {"2024-01-02"}
      user_id {1}
      room_id {1}
    end
  end