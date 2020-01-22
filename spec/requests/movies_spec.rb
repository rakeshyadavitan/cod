require 'rails_helper'

RSpec.describe 'Movie API', type: :request do

  subject { JSON.parse(response.body) }

  let!(:movies) { create_list(:movie, 10) }
  let!(:seasons) { create_list(:season, 5) }

  describe 'GET /movies' do
    it 'return all movies' do
      get '/api/v1/movies'
      expect(json).not_to be_empty
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['movies'].count).to eql 10
    end
  end

  describe 'GET /movies/movies_and_seasons' do
    it 'return all movies and seasons' do
      get '/api/v1/movies/movies_and_seasons'
      expect(json).not_to be_empty
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['movies_and_seasons'].count).to eql 15
    end
  end

end