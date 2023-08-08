class Video
  attr_reader :youtube_video_id,
              :title

  def initialize(data)
    @youtube_video_id = data[:items].first[:id][:videoId]
    @title = data[:items].first[:snippet][:title]
  end
end