class CoinsController < ApplicationController
  before_action :authenticate_user!
  def index
    @coins = [1, 2, 5, 10, 20, 50, 100, 200]
  end

  def add_coin
    coins = params[:coins]
    user = User.find(current_user)
    if user.balance.nil?
      user.balance = 0
    end
    user.balance = user.balance + coins.to_i
    user.save
    redirect_to coins_path
  end
end
