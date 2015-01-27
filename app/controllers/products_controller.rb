class ProductsController < ApplicationController

  def index
    grp_id = params[:grp_id].blank? ? nil : params[:grp_id]
    @products = Product.where(group_id: grp_id).order(:is_leaf, :name)
    @product_parents = Product.where("id in (?)", parents_list_id(grp_id)) unless grp_id.nil?
  end
  
  def edit
    
  end

end
