class Api::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :update, :destroy]

  def index
    @addresses = current_user.addresses.all
    authorize! :read, @addresses.first
    render json: @addresses
  end

  def show
    authorize! :show, Address
    render json: @address
  end

  def create
    authorize! :create, Address
    address = current_user.addresses.new(address_params)
    if address.save
      render json: address
    else
      render_errors address
    end
  end

  def update
    authorize! :update, Address
    if @address.update(address_params)
      render json: @address
    else
      render_errors @address
    end
  end

  def destroy
    authorize! :destroy, Address
    render json: @address.destroy
  end

  private

  def address_params
    params.require(:address).permit(
      :id,
      :street1,
      :street2,
      :city,
      :state,
      :zipcode,
      :country,
      :address_type,
    )
  end

  def set_address
    @address = current_user.addresses.find(params[:id])
  end

end
