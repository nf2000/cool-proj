require 'rails_helper'

RSpec.describe Session, type: :feature do #class name and type
    describe 'checking the validitiy of a user' do
        it "make a user when all the data is set correctly" do 
            session = Session.new
            session.email = "nimra@email.com"
            session.password = "password"
            session.save
            
            expect(session.save).to eq(true)
        end

    end
end