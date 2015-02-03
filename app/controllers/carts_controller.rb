class CartsController < ApplicationController
  
  def index
  end

  def show
    @cart_items = Cart.all  
  end
  
  def create
    @product = Product.find(params[:cart][:id])
    @product.to_cart!
    respond_to do |format|
      format.html { redirect_to @product }
      format.js
    end
  end

  def destroy
    @product = Cart.find(params[:id]).product
    @product.from_cart!
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
end
