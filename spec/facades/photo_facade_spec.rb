require "rails_helper"

RSpec.describe PhotoFacade do
  it "returns videos for a given country", :vcr do
    photos = PhotoFacade.new.search("Thailand")
    expect(photos).to be_an(Array)
    expect(photos.count).to eq(10)
  end
end