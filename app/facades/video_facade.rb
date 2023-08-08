class VideoFacade
  def search(country)
    results = service.search(country)
    Video.new(results)
  end

  def service
    VideoService.new
  end
end