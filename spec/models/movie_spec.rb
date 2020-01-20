require 'rails_helper'

RSpec.describe Movie, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }

  describe "recent" do
    before(:each) do
      @movie1 = FactoryBot.create :movie
      @movie2 = FactoryBot.create :movie
      @movie3 = FactoryBot.create :movie
      @movie4 = FactoryBot.create :movie

      #we will touch some seasons to update them
      @movie2.update_attributes(created_at: Time.now())
    end

    it "returns the most recently updated records" do
      expect(Movie.recent).to match_array([@movie2, @movie4, @movie3, @movie1])
    end
  end
  
end
