class CartsController < ApplicationController
  def show
    @current_cart = Cart.find(params[:id])
  end

  def checkout
    current_user.update(current_cart: nil)
    @current_cart = Cart.find(params[:id])
    @current_cart.checkout
    redirect_to cart_path(@current_cart)
  end
end
