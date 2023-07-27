require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns paginated users' do
      # Create test data (you can use FactoryBot or other methods)
      user1 = User.create(name: 'John Doe', age: 30, email: 'john@example.com')
      user2 = User.create(name: 'Jane Smith', age: 25, email: 'jane@example.com')

      # Make the GET request with pagination parameters
      get :index, params: { page: 1, per_page: 1 }

      # Validate the response
      expect(response).to have_http_status(:success)

      # Parse the JSON response
      json_response = JSON.parse(response.body)

      # Assert that the response contains only one user (due to pagination)
      expect(json_response['users'].count).to eq(1)

      # Add more expectations as needed
    end

    it 'returns filtered users when search query is provided' do
      # Create test data
      user1 = User.create(name: 'John Doe', age: 30, email: 'john@example.com')
      user2 = User.create(name: 'Jane Smith', age: 25, email: 'jane@example.com')

      # Make the GET request with the search query parameter
      get :index, params: { query: 'John' }

      # Validate the response
      expect(response).to have_http_status(:success)

      # Parse the JSON response
      json_response = JSON.parse(response.body)

      # Assert that the response contains only one user (matching the search query)
      expect(json_response['users'].count).to eq(1)
      expect(json_response['users'].first['name']).to eq('John Doe')

      # Add more expectations as needed
    end
  end
end