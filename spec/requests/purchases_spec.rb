require 'rails_helper'

RSpec.describe 'post purchase content API', type: :request do
  it "POST #create" do
    current_user = FactoryBot.create :user    
    @movie = FactoryBot.create :movie    
    post '/api/v1/purchases', params: {"purchase": {"purchaseable_type": "Movie", "purchaseable_id": @movie.id, "price": 4.99, "video_quality": "SD"}}
    expect(response).to have_http_status 201
  end
end