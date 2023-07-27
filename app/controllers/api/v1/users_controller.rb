require 'net/http'
require 'json'

class Api::V1::UsersController < ApplicationController
  def index
    users = ApiService.fetch_users

    if params[:query].present?
      search_service = SearchService.new(users)
      @users = search_service.search_by_name(params[:query])
    else
      @users = users
    end    

    @users = @users.paginate(page: params[:page], per_page: 10)
  end
end
