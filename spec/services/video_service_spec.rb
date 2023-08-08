require "rails_helper"

RSpec.describe VideoService do
  it "returns a list videos for country searched", :vcr do
    search_results = VideoService.new.search("Thailand")
    expect(search_results).to be_a(Hash)
    expect(search_results).to have_key(:items)
    expect(search_results[:items]).to be_an(Array)
    expect(search_results[:items].first).to be_a(Hash)
    expect(search_results[:items].first).to have_key(:id)
    expect(search_results[:items].first).to have_key(:snippet)
    expect(search_results[:items].first[:id][:videoId]).to be_a(String)
    expect(search_results[:items].first[:snippet][:title]).to be_a(String)
    expect(search_results[:items].first[:snippet][:description]).to be_a(String)
  end
end