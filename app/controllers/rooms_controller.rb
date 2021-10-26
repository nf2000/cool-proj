class RoomsController < ApplicationController

    def index
        @rooms = Room.all
        @bookings = Booking.all
        # @rooms = Booking.where.not("check_in <= ? AND check_out >= ?", check_out, check_in)
        #@booking = Booking.find(params[:check_in, :check_out])
        @roomsTakenIds = Room.includes(:bookings).where( "bookings.check_in = ? AND bookings.check_out = ?",params[:check_in], params[:check_out] ).pluck(:id)


        #@roomsTakenIds = Booking.where.not("check_in = ? ", :check_in).pluck(:room_id)   
        @roomsAvailable = @rooms.filter{|room| !@roomsTakenIds.include?(room.id)}

       
       #@roomsAvailable = Room.joins(' FULL OUTER JOIN "bookings" ON "rooms"."id" = "bookings"."id" ').where.not("bookings.check_in <= ? AND bookings.check_out >= ?", :check_out, :check_in)
        Rails.logger.warn("***********")
        Rails.logger.warn(@roomsTakenIds)
        Rails.logger.warn("***********" )

        
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
