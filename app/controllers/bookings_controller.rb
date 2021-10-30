class BookingsController < ApplicationController
    before_action :find_user, :find_room

    def index
        @user = User.find(session[:user_id])
        @booking = @user.bookings
        @sorted = @booking.order(:room_id)
    end

    def new 
        @room = Room.find(params[:room_id])
        @booking = Booking.new
    end 

    def show 
        @user = User.find(session[:user_id])
        @bookings = Booking.find(params[:id])
        @room = @bookings.room
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

    def destroy
        @booking = Booking.find(params[:id])
        if @booking.destroy
            flash[:success] =  "'#{@booking.id}' successfully deleted."  
            redirect_to root_path 
        else
            flash.now[:danger] = "could not delete blog post"
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
            redirect_to root_path
        else
            flash.now[:danger] = "unable to update booking"
            render 'edit'
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
        if !params[:room_id].nil?
            @room = Room.find(params[:room_id])
        end

    end
end
