require 'rails_helper'
require "models/concerns/purchaseable_spec"

RSpec.describe Season, type: :model do

  it { should have_many(:episodes).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
  it { should validate_presence_of(:number) }
  it { should validate_numericality_of(:number).is_greater_than_or_equal_to(0) }
  it_behaves_like "purchaseable"

  before { @season = FactoryBot.build(:season) }

  subject { @season }
  
  describe "#episodes association" do

    before do
      @season.save
      3.times { FactoryBot.create :episode, season: @season }
    end

    it "destroys the associated episodes on self destruct" do
      episodes = @season.episodes
      @season.destroy
      episodes.each do |episode|
        expect(Episode.find(episode)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "recent" do
    before(:each) do
      @season1 = FactoryBot.create :season
      @season2 = FactoryBot.create :season
      @season3 = FactoryBot.create :season
      @season4 = FactoryBot.create :season

      #we will touch some seasons to update them
      @season2.update_attributes(created_at: Time.now())
    end

    it "returns the most recently updated records" do
      expect(Season.recent).to match_array([@season2, @season4, @season3, @season1])
    end
  end

end
