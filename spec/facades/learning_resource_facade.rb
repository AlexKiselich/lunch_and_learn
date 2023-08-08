require "rails_helper"

RSpec.describe LearningResourceFacade do
  it "returns a learning resource for a given country", :vcr do
    learning_facade = LearningResourceFacade.new.search("Thailand")

    expect(learning_facade).to be_a(Array)
  end
end