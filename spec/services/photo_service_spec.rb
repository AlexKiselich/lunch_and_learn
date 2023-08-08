require "rails_helper"

RSpec.describe PhotoService do
  it "returns 10 photos for country searched", :vcr do
    search_results = PhotoService.new.search("Thailand")
    
    expect(search_results).to be_a(Hash)
    expect(search_results).to have_key(:results)
    expect(search_results[:results]).to be_an(Array)
  end
end