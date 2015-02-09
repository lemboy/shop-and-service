class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    grp_id = params[:grp_id].blank? ? nil : params[:grp_id]
    @customers = Customer.where(group_id: grp_id).order(is_leaf: :asc, name: :asc)
    @customer_parents = Customer.where("id in (?)", parents_list_id(Customer, grp_id)).order(:id) unless grp_id.nil?
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @customer.update_attributes(customer_params)
      flash[:success] = "Customer updated"
      redirect_to customers_path+"?grp_id=#{@customer.group_id}"
    else
      render 'edit'
    end
  end
  
  def new
    @customer = Customer.new
    @customer.is_leaf = params[:is_leaf]
    @customer.group_id = params[:grp_id]
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "Customer created"
      redirect_to customers_path+"?grp_id=#{@customer.group_id}"
    else
      render 'new'
    end
  end
  
  def destroy
    grp_id = @customer.group_id
    @customer.destroy
    flash[:success] = "Deleted." if @customer.destroyed?
    if @customer.errors.any?
      flash[:danger] = "#{@customer.name} - #{@customer.errors.full_messages.join(' ')}"
    end
    redirect_to customers_path+"?grp_id=#{grp_id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :print_name, :contact_person, :contact_phone, 
                                        :is_leaf, :group_id)
    end
end
