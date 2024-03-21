class Api::V1::RoomsController < Api::V1::ApiController

    def index
        @rooms = Room.all
        render json: @rooms
    end

    def create
          @rooms = Room.new(room_params)
          if @rooms.save
              render json: @rooms, status: :created
          else
              render json: @rooms, status: :unprocessable_entity
          end
      end

      def show
        @room = Room.find(params[:id])
        render json: {status: 'SUCCESS', data:@room}, status: :ok
      end
      
    def update
        @room = Room.find(params[:id])
        respond_to do |format|
        if @room.update(room_params)
            format.json { render :show, status: :ok, location: @room }
        else
            format.json { render json: @room.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        respond_to do |format|
        format.json { head :no_content }
        end
    end

    private
      
      def room_params
        params.require(:room).permit(:location_id, :name, :description)
      end
  end
