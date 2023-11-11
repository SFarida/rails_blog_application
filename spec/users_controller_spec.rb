require_relative 'rails_helper'
RSpec.describe 'UsersController', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      # this will perform a GET request to the /users route
      get '/users'

      # Check the http response for the correct placeholder text
      # expect(response.body).to include('User Index Works')

      # Check the http status of the response
      expect(response.status).to eq(200)

      # Check if the correct template was rendered
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      # this will perform a GET request to the /users route
      get '/users/1'

      # Check the http response for the correct placeholder text
      # expect(response.body).to include('User Show Works')

      # Check the http status of the response
      expect(response.status).to eq(200)

      # Check if the correct template was rendered
      expect(response).to render_template('show')
    end
  end
end
