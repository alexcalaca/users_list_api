require 'net/http'
require 'json'

class Api::V1::UsersController < ApplicationController
  def index
    @users = ApiService.fetch_users

    @users = @users.paginate(page: params[:page], per_page: 10)
  end
end
