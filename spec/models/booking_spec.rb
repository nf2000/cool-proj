require 'rails_helper'

RSpec.describe Booking, type: :model do #class name and type
    describe 'Cannot make a booking without checkin' do
        it "make a booking when all the data is set" do 
            booking = FactoryBot.create(:booking)
            expect(booking.save).to eq(true)
        end  

        describe 'presence check' do
            subject { build(:booking) }
            it { should validate_presence_of(:check_in) }
            it { should validate_presence_of(:check_out) }
            it { should validate_presence_of(:guests) }
        end

        describe '#out_date_after_in_date' do
            it 'returns false if check-out is later than the check-in' do 
                room = FactoryBot.create(:room)
                booking = FactoryBot.create(:booking, check_in: "2024-02-06", check_out: "2024-02-05", room_id: room.id)
                booking.out_date_after_in_date?.errors
                expect(booking.out_date_after_in_date?).to match("check out must be after the check In date")
            end
        end


    end
end