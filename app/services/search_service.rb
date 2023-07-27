class SearchService
  def initialize(users)
    @users = users
  end

  def search_by_name(query)
    @users.select { |user| user['name'].include?(query) }
  end

  def search_by_email(query)
    @users.select { |user| user['email'].include?(query) }
  end
end
