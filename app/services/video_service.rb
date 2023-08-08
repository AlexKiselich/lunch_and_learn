class VideoService

  def search(country)
    get_url("/youtube/v3/search?q=#{country}")
  end


  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.googleapis.com") do |f|
      f.params["key"] = ENV["YOUTUBE_KEY"]
      f.params["part"] = "snippet"
      f.params["type"] = "video"
      f.params["channelId"] = "UCluQ5yInbeAkkeCndNnUhpw"
    end
  end
end