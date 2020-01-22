require 'rails_helper'

RSpec.describe 'post purchase content API', type: :request do

  before do
    current_user = FactoryBot.create :user    
    purchaseable = FactoryBot.create :movie
    post '/api/v1/purchases', params: {"purchase": {"purchaseable_type": purchaseable.class.name, "purchaseable_id": purchaseable.id, "price": 4.99, "video_quality": "SD"}}
  end

  it "POST #create" do
    expect(response).to have_http_status 201
  end

  it "update library if date of purchasing is more than 2 days" do
    library = Purchase.last
    library.created_at = 2.days.ago
    library.save
    post '/api/v1/purchases', params: {"purchase": {"purchaseable_type": library.purchaseable_type, "purchaseable_id": library.purchaseable_id, "price": library.price, "video_quality": library.video_quality}}
    expect(response).to have_http_status 200
    expect(library.reload.created_at).not_to eq 2.days.ago
  end

end