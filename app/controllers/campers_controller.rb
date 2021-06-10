class CampersController < ApplicationController
    def index
        campers=Campers.all
        render json: campers only: [:id,:name,:age]
    end
end
