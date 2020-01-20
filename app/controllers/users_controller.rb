class UsersController < ApplicationController

  def show
    user = User.order("RANDOM()").first
    library = user.purchases.order('created_at')
    json_response(library)
  end
end
