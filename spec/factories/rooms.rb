# This will guess the User class
FactoryBot.define do
    factory :room do 
      name { "Room7" }
      capacity  { 5 }
      cost {200}
      bed_no {2}
      bed_type {"Double"}
    end
  end