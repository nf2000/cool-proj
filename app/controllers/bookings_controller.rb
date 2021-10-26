class BookingsController < ApplicationController
    before_action :find_user, :find_room


    def index
        @bookings = Booking.all
    end

    def new 
        @booking = Booking.new
    end 

    def show 
        @user = User.find(session[:user_id])
        @room = Room.find(params[:room_id])
        @bookings = Booking.find(params[:id])

    end


    def create 
        @booking = Booking.new(booking_param) 
        @booking.user_id = session[:user_id]
        @booking.room_id = @room.id
        if @booking.save
            flash.now[:success] = "booking created"
            return redirect_to room_booking_path("#{@booking.room_id}","#{@booking.id}")
        else
            flash.now[:danger] =  @booking.errors.full_messages #"Can't create booking"
            render 'new'
        end
        
        
    end

    private
    def booking_param
        params.require(:booking).permit(:user_id,:room_id,:guests,:check_in,:check_out)

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
