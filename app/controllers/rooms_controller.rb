class RoomsController < ApplicationController

    def index
        @rooms = Room.all
        @bookings = Booking.all
        if (!params[:check_in].blank? || !params[:check_out].blank?) && (params[:check_in] > params[:check_out])
            redirect_to root_path 
            flash[:danger] = "check-in must be earlier than check-out"
        else
            @roomsTakenIds = Room.includes(:bookings).where( "bookings.check_in <= ? AND bookings.check_out >= ?",params[:check_in], params[:check_out] ).pluck(:room_id)
            @roomsAvailable = @rooms.filter{|room| !@roomsTakenIds.include?(room.id)}  
        end
    end

    private
    def room_param
        params.require(:room).permit(:room_id)
    end

    def booking_param
        params.permit(:check_in, :check_out)
    end
end
