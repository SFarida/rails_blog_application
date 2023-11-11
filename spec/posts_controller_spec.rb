require_relative 'rails_helper'
RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      # this will perform a GET request to the /users route
      get '/users/1/posts'

      # Check the http response for the correct placeholder text
      expect(response.body).to include('Post Index Works')

      # Check the http status of the response
      expect(response.status).to eq(200)

      # Check if the correct template was rendered
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      # this will perform a GET request to the /users route
      get '/users/1/posts/1'

      # Check the http response for the correct placeholder text
      expect(response.body).to include('Post Show Works')

      # Check the http status of the response
      expect(response.status).to eq(200)

      # Check if the correct template was rendered
      expect(response).to render_template('show')
    end
  end
end
