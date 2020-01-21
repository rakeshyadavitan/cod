require 'rails_helper'

RSpec.describe 'Movie API', type: :request do
  # initialize test data 
  let!(:movies) { create_list(:movie, 10) }
  describe 'GET /movies' do
    # make HTTP get request before each example
    before { get '/movies' }

    it 'returns movies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end