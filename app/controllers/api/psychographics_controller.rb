class Api::PsychographicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_psychographic, except: %i[index]

  def index
    authorize! :read, Psychographic
    render json: Psychographic.all
  end

  def show
    authorize! :read, Psychographic
    render json: @psychographic
  end

  def create
    authorize! :create, Psychographic
    psychographic = Psychographic.new(psychographic_params)
    if psychographic.save
      render json: psychographic
    else
      render_errors psychographic
    end
  end

  def update
    authorize! :update, Psychographic
    if @psychographic.update(psychographic_params)
      render json: @psychographic
    else
      render_errors @psychographic
    end
  end

  def delete
    authorize! :delete, Psychographic
    render json: @psychographic.destroy
  end

  private

  def psychographic_params
    params.require(:psychographic).permit(
      :title,
      :description
    )
  end

  def set_psychographic
    @psychographic = Psychographic.find(params[:id])
  end
end
