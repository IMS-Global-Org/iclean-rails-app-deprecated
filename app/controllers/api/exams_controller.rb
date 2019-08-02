class Api::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exam, except: %i[index]

  def index
    authorize! :read, Exam
    exams = Exam
      .where(examable_type: params[:examable_type])
      .where(examable_id: params[:examable_id])
    render json: exams.to_json
  end

  def show
    authorize! :read, Exam
    render json: @exam
  end

  def create
    authorize! :create, Exam
    exam = Exam.new(exam_params)
    if exam.save
      render json: exam
    else
      render_errors exam
    end
  end

  def update
    authorize! :update, Exam
    if @exam.update(exam_params)
      render json: @exam
    else
      render_errors @exam
    end
  end

  def delete
    authorize! :delete, Exam
    render json: @exam.destroy
  end

  private

  def exam_params
    params.require(:exam).permit(
      :title,
      :description,
      :icon
    )
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end
