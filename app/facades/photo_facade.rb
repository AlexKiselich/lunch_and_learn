class PhotoFacade
  def search(country)
    response = service.search(country)
    photos = response[:results].map do |data|
      Photo.new(data)
    end
  end

  def service
    PhotoService.new
  end
end