class VendorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def withdraw
    current_user.update(:balance => 0)
    flash[:alert] = "Your coins have been returned!"
    redirect_to root_url
  end
end
