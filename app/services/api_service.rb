class ApiService
  require 'net/http'
  require 'json'

  API_URL = 'https://run.mocky.io/v3/ce47ee53-6531-4821-a6f6-71a188eaaee0'

  def self.fetch_users
    url = URI.parse(API_URL)
    response = Net::HTTP.get(url)
    user_data = JSON.parse(response)['users']

    user_data.map do |user_data|
      User.new(
        id: user_data['id'],
        name: user_data['name'],
        age: user_data['age'],
        email: user_data['email']
      )
    end
  end
end
