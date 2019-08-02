class Api::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, except: %i[index create]

  def index
    authorize! :read, Question
    render json: Question.all
  end

  def show
    authorize! :read, Question
    render json: @question
  end

  def create
    authorize! :create, Question
    question = Question.new(question_params)
    if question.save
      render json: question
    else
      render_errors question
    end
  end

  def update
    authorize! :update, Question
    if @question.update(question_params)
      render json: @question
    else
      render_errors @question
    end
  end

  def destroy
    authorize! :destroy, Question
    render json: @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(
      :text,
      :hint,
      :exam_id,
    )
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
