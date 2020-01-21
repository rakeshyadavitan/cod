class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    expiration_time = 2.days.ago
    user_purchases = user.purchases.where('purchases.created_at >= ?', expiration_time).order('created_at')
    library_data = []
    data = {}
    user_purchases.each do |i|
      data = {}
      data[:title] = i.purchaseable.title
      data[:remaining_time] = "#{((i.created_at - expiration_time)/1.hour).round} hour(s)"
      library_data << data
    end
    json_response(library: library_data)
  end

end
