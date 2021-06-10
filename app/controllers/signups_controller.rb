class SignupsController < ApplicationController

    def create
        signup = Signup.create!(params.permit(:time, :camper_id, :activity_id))
        activity = signup.activity
        render json: activity, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

end
