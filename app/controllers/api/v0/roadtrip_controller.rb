class Api::V0::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !params[:origin].present? || !params[:destination].present?
      render json: {error: "Please provide origin and destination"}, status: 400
    else
      if user.nil?
        render json: {error: "Unauthorized"}, status: 401
      else
        road_trip = RoadtripFacade.new.find_travel_time(params[:origin], params[:destination])
        render json: RoadTripSerializer.new(road_trip)
      end
    end
  end
end