require 'rails_helper'

RSpec.describe 'User API', type: :request do

  subject { JSON.parse(response.body) }

  describe 'show /user/:id' do

    let!(:user) { create(:user) }
    let!(:season) { create(:season) }
    let!(:movie) { create(:movie) }

    before do
      user_id = user.id
      get "/api/v1/users/#{user_id}"
    end

    it 'return data from library which are less than 2 day old' do
      create(:purchase, purchaseable_type: season.class.name, purchaseable_id: season.id, price: 1, video_quality: 'HD')
      create(:purchase, purchaseable_type: movie.class.name, purchaseable_id: movie.id, price: 1, video_quality: 'HD')
      Purchase.update_all(user_id: user.id)
      library = Purchase.first
      library.created_at = 2.days.ago
      library.save
      get "/api/v1/users/#{user.id}"
      expect(JSON.parse(response.body)['library'].size).to eql 1
      expect(json).not_to be_empty
      expect(response).to have_http_status(200)
    end

  end
end