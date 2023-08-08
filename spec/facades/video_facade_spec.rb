require "rails_helper"

RSpec.describe VideoFacade do
  it "returns videos for a given country", :vcr do
    video = VideoFacade.new.search("Thailand")

    expect(video).to be_a(Video)
  end
end