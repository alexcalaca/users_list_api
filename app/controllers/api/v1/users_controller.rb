require 'net/http'
require 'json'

class Api::V1::UsersController < ApplicationController
  def index
    url = URI.parse('https://run.mocky.io/v3/ce47ee53-6531-4821-a6f6-71a188eaaee0')
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    @users = data['users'].map do |user_data|
      User.new(
        id: user_data['id'],
        name: user_data['name'],
        age: user_data['age'],
        email: user_data['email']
      )
    end
  end
end
