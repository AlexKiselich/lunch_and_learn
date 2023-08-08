class LearningResource
  attr_reader :id,
              :type,
              :country,
              :video,
              :photos,
              :country

  def initialize(country, photos, video)
    @id = nil
    @type = "learning_resource"
    @country = country
    @video = video
    @photos = photos
  end
end