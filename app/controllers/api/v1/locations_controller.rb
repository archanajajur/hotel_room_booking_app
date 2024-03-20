class Api::V1::LocationsController < Api::V1::ApiController

    def index
        @location = Location.all
        render json: @location
    end

    def create
          @location = Location.new(location_params)
          if @location.save
              render json: @location, status: :created
          else
              render json: @location, status: :unprocessable_entity
          end
      end

      def show
        @location = Location.find(params[:id])
        render json: {status: 'SUCCESS', data:@location}, status: :ok
      end
      
    def update
        @location = Location.find(params[:id])
        respond_to do |format|
        if @location.update(location_params)
            format.json { render :show, status: :ok, location: @location }
        else
            format.json { render json: @location.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @location = Location.find(params[:id])
        @location.destroy
        respond_to do |format|
        format.json { head :no_content }
        end
    end

    private
      
      def location_params
        params.require(:location).permit( :name, :description)
      end
  
  end
