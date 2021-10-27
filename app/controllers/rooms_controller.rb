class RoomsController < ApplicationController

    def index
        @rooms = Room.all
        @bookings = Booking.all
        @roomsTakenIds = Room.includes(:bookings).where( "bookings.check_in <= ? AND bookings.check_out >= ?",params[:check_in], params[:check_out] ).pluck(:room_id)
        @roomsAvailable = @rooms.filter{|room| !@roomsTakenIds.include?(room.id)}


        Rails.logger.warn("******")
        Rails.logger.warn(params[:check_in]..params[:check_out])
        Rails.logger.warn("******")


    end

    def new 
        @room = Room.new
    end 

    def show 
        @room = Room.find(params[:id])
    end 

    def create 
        @room = Room.new(room_param) 
        redirect_to new_rooms_booking_path()
    end

    private
    def room_param
        params.require(:room).permit(:room_id)
    end

    def booking_param
        params.permit(:check_in, :check_out)
    end


end
