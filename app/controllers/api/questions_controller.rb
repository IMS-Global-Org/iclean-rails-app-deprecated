class Api::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, except: %i[index create]

  QUESTIONABLES = %i[psychographic_id].freeze

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
    question = questionable.questions.new(question_params)
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

  def question_types
    authorize! :read, Question
    render json: Question.question_types
  end

  private

  def question_params
    params.require(:question).permit(
      :text,
      :hint,
      :question_type
    )
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def questionable
    @questionable ||= create_questionable
  end

  def create_questionable
    questionable_id = QUESTIONABLES.each { |q| params.key?(q) }
    questionable_model = questionable_id.split('_')[0].camelcase.constantize
    questionable_model.find(params[questionable_id])
  end
end
