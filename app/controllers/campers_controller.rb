class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create(camper_params)
       if camper.valid?
        render json: camper, status: 201
       else
        render json: {errors: camper.errors.full_messages}, status: 422
       end
    end


    private

    def camper_params
        params.permit(:name, :age)
    end
    
    def find_camper
        Camper.find(params[:id])
    end

    def record_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    #Create a camper
    #Define a route - Done in routes


end
