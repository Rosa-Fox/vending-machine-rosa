class ProductsController < ApplicationController
  def restock
    `rake db:seed`
    redirect_to root_url
  end
end
