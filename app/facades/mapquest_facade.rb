class MapquestFacade
  def initialize(location)
    @location = location
  end

  def find_coordinates
    json = MapquestService.new.get_mapquest_data(@location)
    data = json[:results][0][:locations][0][:latLng]
    Mapquest.new(data)
  end
end