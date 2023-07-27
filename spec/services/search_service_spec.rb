require 'rails_helper'

RSpec.describe SearchService do
  describe '#search_by_name' do
    it 'returns users matching the given name query' do
      # Mock user data for testing
      users = [
        { 'id' => 1, 'name' => 'John Doe', 'age' => 30, 'email' => 'john@example.com' },
        { 'id' => 2, 'name' => 'Jane Smith', 'age' => 25, 'email' => 'jane@example.com' }
      ]

      # Create a new SearchService instance with the mock user data
      search_service = SearchService.new(users)

      # Perform the search by name
      results = search_service.search_by_name('John')

      # Assert that the search results include the user with name 'John Doe'
      expect(results.length).to eq(1)
      expect(results.first['name']).to eq('John Doe')
    end

    it 'returns an empty array if no user matches the given name query' do
      # Mock user data for testing
      users = [
        { 'id' => 1, 'name' => 'John Doe', 'age' => 30, 'email' => 'john@example.com' },
        { 'id' => 2, 'name' => 'Jane Smith', 'age' => 25, 'email' => 'jane@example.com' }
      ]

      # Create a new SearchService instance with the mock user data
      search_service = SearchService.new(users)

      # Perform the search by name with a query that doesn't match any user
      results = search_service.search_by_name('Mike')

      # Assert that the search results are empty
      expect(results).to be_empty
    end
  end

  describe '#search_by_email' do
    it 'returns users matching the given email query' do
      # Mock user data for testing
      users = [
        { 'id' => 1, 'name' => 'John Doe', 'age' => 30, 'email' => 'john@example.com' },
        { 'id' => 2, 'name' => 'Jane Smith', 'age' => 25, 'email' => 'jane@example.com' }
      ]

      # Create a new SearchService instance with the mock user data
      search_service = SearchService.new(users)

      # Perform the search by email
      results = search_service.search_by_email('john@example.com')

      # Assert that the search results include the user with email 'john@example.com'
      expect(results.length).to eq(1)
      expect(results.first['email']).to eq('john@example.com')
    end

    it 'returns an empty array if no user matches the given email query' do
      # Mock user data for testing
      users = [
        { 'id' => 1, 'name' => 'John Doe', 'age' => 30, 'email' => 'john@example.com' },
        { 'id' => 2, 'name' => 'Jane Smith', 'age' => 25, 'email' => 'jane@example.com' }
      ]

      # Create a new SearchService instance with the mock user data
      search_service = SearchService.new(users)

      # Perform the search by email with an email that doesn't match any user
      results = search_service.search_by_email('mike@example.com')

      # Assert that the search results are empty
      expect(results).to be_empty
    end
  end
end  

