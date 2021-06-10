class CampersController < ApplicationController

    # validates :name, presence: true
    # validates :age,  :inclusion => 8..18

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, include: :activities
        else
            render json: {error:"Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private
    def camper_params
        params.permit(:name,:age)
    end

end
