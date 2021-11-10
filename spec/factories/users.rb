# This will guess the User class
FactoryBot.define do
    factory :user do 
      firstname { "Nimra" }
      surname  { "Fatima" }
      email {"nimrafatima@email.com"}
      password {"password"}
      password_confirmation {"password"}
    end
  end