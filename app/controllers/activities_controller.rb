class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities only:[:id,:name,:difficulty]
    end

end
