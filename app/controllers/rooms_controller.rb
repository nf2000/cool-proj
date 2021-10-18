class RoomsController < ApplicationController

    def index
        @rooms = Room.all
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

    
end
