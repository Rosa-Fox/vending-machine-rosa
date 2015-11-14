class ProductsController < ApplicationController
  before_action :authenticate_user!
  def restock
    Product.delete_all
    `rake db:seed`
    redirect_to root_url
  end

  def purchase
    return_home = redirect_to root_url
    product = Product.find(params[:product])
    if product.quantity <= 0
      flash[:alert] = 'No snacks left!'
      return_home
    else
      if current_user.balance > product.price
        product.quantity = product.quantity - 1
        product.save
        current_user.balance = current_user.balance - product.price
        current_user.save
        flash[:alert] = "Enjoy your #{product.name.capitalize}!"
        return_home
      else
        flash[:alert] = 'You have run out of coins!'
        return_home
      end
    end
  end
end
