require 'rails_helper'

RSpec.describe Room, type: :model do #class name and type
    describe '#is_empty?' do
        it "returns true if there no bookings" do
            room = FactoryBot.create(:room)
            expect(room.is_empty?).to eq(true)
        end
        it "returns false if there bookings" do
            room = FactoryBot.create(:room)
            FactoryBot.create(:booking, room_id: room.id)
            FactoryBot.create(:booking, check_in: "2024-02-02", check_out: "2024-02-02", room_id: room.id)
            FactoryBot.create(:booking, check_in: "2024-02-06", check_out: "2024-02-06", room_id: room.id)
            expect(room.is_empty?).to eq(false)
        end
    end
end