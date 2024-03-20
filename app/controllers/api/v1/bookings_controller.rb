class Api::V1::BookingsController < Api::V1::ApiController

    def index
        @bookings = current_user.bookings
        render json: @bookings
    end

    def create
          @booking = Booking.new(booking_params_with_date)
          if @booking.save
              render json: @booking, status: :created
          else
              render json: @booking, status: :unprocessable_entity
          end
      end

      def show
        @booking = Booking.find(params[:id])
        render json: {status: 'SUCCESS', data:@booking}, status: :ok
      end
      
    def update
        @booking = Booking.find(params[:id])
        respond_to do |format|
        if @booking.update(booking_params_with_date)
            format.json { render :show, status: :ok, location: @booking }
        else
            format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        respond_to do |format|
        format.json { head :no_content }
        end
    end

    private
      
      def booking_params
        params.require(:booking).permit(:user_id, :room_id, :check_in, :check_out, :no_of_rooms)
      end
  
      def booking_params_with_date
        booking_det = booking_params
        booking_det["check_in"] = Date.strptime(booking_det["check_in"], '%m/%d/%Y').to_date
        booking_det["check_out"] = Date.strptime(booking_det["check_out"], '%m/%d/%Y').to_date
        booking_det["no_of_rooms"] = k["no_of_rooms"]
        return booking_det
      end
  end