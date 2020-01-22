require 'rails_helper'

RSpec.describe 'Season API', type: :request do

  subject { JSON.parse(response.body) }

  let!(:seasons) { create_list(:season, 10) }

  describe 'GET /seasons' do
    it 'return 10 seasons' do
      get '/api/v1/seasons'
      expect(json).not_to be_empty
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eql 10
    end
  end
end