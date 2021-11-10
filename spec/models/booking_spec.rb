require 'rails_helper'

RSpec.describe Booking, type: :model do #class name and type
    describe 'Cannot make a booking without checkin' do
        it "make a booking when all the data is set" do 
            booking = FactoryBot.create(:booking)
            expect(booking.save).to eq(true)
        end    
        
        it { should validate_presence_of(:check_in) }
       
        
        it "throws an error when checkout not present" do 
            user = User.new
            user.firstname = "Nim"
            user.surname = "ok"
            user.email = "nim4@email.com"
            user.password = "password"
            user.password_confirmation = "password"
            user.save
            room = Room.new
            room.capacity = 2
            room.save
            booking = Booking.new
            booking.user_id = user.id
            booking.room_id = room.id
            booking.guests = 1
            booking.check_out = nil
            booking.check_in = "2023-11-11"
            expect(booking.save).to eq(false)
        end
        it "throws an error when guests not present" do 
            user = User.new
            user.firstname = "Nim"
            user.surname = "ok"
            user.email = "nim4@email.com"
            user.password = "password"
            user.password_confirmation = "password"
            user.save
            room = Room.new
            room.capacity = 2
            room.save
            booking = Booking.new
            booking.user_id = user.id
            booking.room_id = room.id
            booking.guests = nil
            booking.check_out = "2023-11-11"
            booking.check_in = "2023-11-11"
            puts booking.valid? #debuggging check if booking is valid
            puts booking.errors.inspect
            expect(booking.save).to eq(false)
        end
    end
end