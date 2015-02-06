class CartsController < ApplicationController
  
  def index
  end

  def show
    @cart_items = Cart.all.order(:id)  
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

  def update
    @cart = Cart.find(params[:id])
    @cart.update_attributes(cart_params)
    if @cart.errors.any?
      flash[:danger] = @cart.errors.full_messages.join(" ")
    end
    respond_to do |format|
      format.html { redirect_to @cart }
      format.js
    end
  end

  private

    def cart_params
      params.require(:cart).permit(:product_count)
    end
  
end
