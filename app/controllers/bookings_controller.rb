class BookingsController < ApplicationController 
    before_action :find_room

    def index
        @booking = current_user.bookings
        @sorted = @booking.order(:id)
    end

    def new 
        @booking = Booking.new
    end 

    def show 
        @bookings = Booking.find(params[:id])
        @room = @bookings.room
        @no_of_days = (@bookings.check_out - @bookings.check_in).to_i
        if @no_of_days == 0
            @no_of_days = 1
        end
    end

    def create 
        @booking = Booking.new(booking_param) 
        if !require_user
            @booking.user_id = current_user.id
            @booking.room_id = @room.id
            if @booking.save
                flash.now[:success] = "booking created"
                redirect_to room_booking_path(@booking.room_id,@booking.id)
            else
                flash.now[:danger] =  @booking.errors.full_messages
                render 'new'
            end  
        end
    end

    def destroy
        @booking = Booking.find(params[:id])
        if @booking.destroy
            flash[:success] =  "'#{@booking.id}' successfully deleted."  
            redirect_to bookings_path 
        else
            flash.now[:danger] = "could not delete booking"
            render 'show'
        end
    end

    def edit
        @booking = Booking.find(params[:id])
    end
    
    def update
        @booking = Booking.find(params[:id])

        if @booking.update(booking_param)
            flash[:success] =  "'#{@booking.id}' successfully updated."  
            redirect_to bookings_path
        else
            flash.now[:danger] = @booking.errors.full_messages
            render 'edit'
        end
    end

    private
    def booking_param
        params.require(:booking).permit(:user_id,:room_id,:guests,:check_in,:check_out)
    end

  
    private 
    def find_room
        if !params[:room_id].nil?
            @room = Room.find(params[:room_id])
        end

    end
end
