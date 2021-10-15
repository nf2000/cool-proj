class BookingsController < ApplicationController
    before_action :find_user


    def index
        @bookings = Booking.all
    end

    def new 
        @booking = Booking.new
    end 

    def create 
        @booking = Booking.new(booking_param) 
        @booking.user_id = session[:user_id]
        #@booking.room_id = @room.id
        # actual_date_format = "02/24/2017"
        #date_goal = actual_date_format.split('/').reverse.join('-')
        if @booking.save
            return redirect_to bookings_path

        else
            render 'new'
        end
        
    end

    private
    def booking_param
        params.require(:booking).permit(:user_id,:guests,:check_in,:check_out)

    end
    
    private 
    def find_user
        @user = session[:user_id]
    end

    private 
    def find_room
        @room = Room.find(params[:room_id])
    end
end
