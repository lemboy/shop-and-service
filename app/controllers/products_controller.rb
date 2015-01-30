class ProductsController < ApplicationController

  def index
    grp_id = params[:grp_id].blank? ? nil : params[:grp_id]
    @products = Product.where(group_id: grp_id).order(is_leaf: :asc, name: :asc)
    @product_parents = Product.where("id in (?)", parents_list_id(grp_id)) unless grp_id.nil?
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to products_path+"?grp_id=#{@product.group_id}"
    else
      render 'edit'
    end
  end
  
  def new
    @product = Product.new
    @product.is_leaf = params[:is_leaf]
    @product.group_id = params[:grp_id]
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created"
      redirect_to products_path+"?grp_id=#{@product.group_id}"
    else
      render 'new'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    grp_id = @product.group_id
    @product.destroy
    flash[:success] = "Deleted." if @product.destroyed?
    if @product.errors.any?
      flash[:danger] = "#{@product.name} - #{@product.errors.get(:base)[0]}"
    end
    redirect_to products_path+"?grp_id=#{grp_id}"
  end
  
  private

    def product_params
      params.require(:product).permit(:name, :description, :measure, :is_service,
                      :purchase_price, :cash_price, :noncash_price, :is_leaf, :group_id)
    end

end
