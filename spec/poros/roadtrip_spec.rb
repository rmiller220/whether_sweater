require 'rails_helper'

RSpec.describe 'RoadTrip Poros' do
  it "exists" do
    origin = {:start_city => "Indianapolis, IN"} 

    destination = {:end_city => "Chicago, IL"}

    travel_time = {:travel_time => "04:40:45"}

    weather_at_eta = { :weather_at_eta => {
                :datetime => "2023-06-13 14:00",
                :temperature => 63.4,
                :condition => "Curry makes it rain"
            }}
      

    roadtrip_data = RoadTrip.new(origin, destination, travel_time, weather_at_eta)

    expect(roadtrip_data).to be_a(RoadTrip)
    expect(roadtrip_data.start_city).to eq(origin)
    expect(roadtrip_data.end_city).to eq(destination)
    expect(roadtrip_data.travel_time).to eq(travel_time)
    expect(roadtrip_data.weather_at_eta).to eq(weather_at_eta)
  end
end