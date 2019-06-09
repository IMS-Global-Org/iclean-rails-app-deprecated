# User related Demographic information
class Api::DemographicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_demographic, except: %i[index]

  def index
    authorize! :read, Demographic
    render json: Demographic.all
  end

  def show
    authorize! :read, Demographic
    render json: @demographic
  end

  def update
    authorize! :update, Demographic
    if @demographic.update(demographic_params)
      render json: @demographic
    else
      render_errors @demographic
    end
  end

  def delete
    authorize! :delete, Demographic
    render json: @demographic.destroy
  end

  def genders
    authorize! :read, Demographic
    render json: {
      options: Demographic.genders,
      value: @demographic
    }
  end

  def ethnicities
    authorize! :read, Demographic
    render json: {
      options: Demographic.ethnicities,
      value: @demographic
    }
  end

  def races
    authorize! :read, Demographic
    render json: {
      options: Demographic.races,
      value: @demographic
    }
  end

  private

  def demographic_params
    params.require(:demographic).permit(
      :age,
      :ethnicity,
      :race,
      :gender
    )
  end

  def set_demographic
    if current_user.demographic.nil?
      @demographic = current_user.create_demographic
      return
    end
    @demographic = current_user.demographic
  end
end
