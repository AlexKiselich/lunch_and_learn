class PhotoService

  def search(country)
    get_url("/search/photos?query=#{country}")
  end


  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params["client_id"] = ENV["UNSPLASH_KEY"]
      f.params["per_page"] = "10"
    end
  end
end