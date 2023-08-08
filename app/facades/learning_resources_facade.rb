class LearningResourcesFacade
  attr_reader :country,
              :video,
              :photos

  def initialize(params)
    @country = params

    video_results = VideoService.new.search(@country)
    if video_results[:items].empty?
      @video = {}
    else
      @video = VideoFacade.new.search(@country)
    end
    photos_results = PhotoService.new.search(@country)
    if photos_results[:results].empty?
      @photos = []
    else
      @photos = PhotoFacade.new.search(@country)
    end
  end
end