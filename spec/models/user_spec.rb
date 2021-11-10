require 'rails_helper'

RSpec.describe User, type: :model do #class name and type
    describe 'checking the validitiy of a user' do
        it "make a user when all the data is set correctly" do 
            user = FactoryBot.create(:user)
            expect(user.save).to eq(true)
        end

        it { should validate_presence_of(:firstname) }
        it { should validate_presence_of(:surname) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email).case_insensitive.with_message(" already has an account with it")}
        it { should validate_presence_of(:password) }
        it { should validate_presence_of(:password_confirmation) }
        it { should validate_confirmation_of(:password).on(:create) }
        it { should have_secure_password(:password) }
    end
end