class Api::AddressesController < ApplicationController
  # TODO set access granted permission
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :update, :destroy]

  def index
    render json: Address.all
  end

  def show
    render json: @address
  end

  def for_user
    render json: current_user.addresses.first
  end

  def create
    # authorize! :create, Address
    address = current_user.addresses.new(address_params)
    if address.save
      render json: address
    else
      render_errors address
    end
  end

  def update
    if @address.update(address_params)
      render json: @address
    else
      render_errors @address
    end
  end

  def destroy
    render json: @address.destroy
  end

  private

  def address_params
    params.require(:address).permit(
      :street1,
      :street2,
      :city,
      :state,
      :zipcode,
      :country,
    )
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
