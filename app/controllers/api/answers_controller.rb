class Api::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: %i[show update create destroy]

  def index
    authorize! :read, Answer
    render json: Answer.all.for(current_user).are_answered
  end

  def show
    authorize! :read, Answer
    render json: @answer
  end

  def create
    authorize! :create, Answer
    answer = Answer.new(answer_params)
    if answer.save
      render json: answer
    else
      render_errors answer
    end
  end

  def update
    authorize! :update, Answer
    if @answer.update(answer_params)
      render json: @answer
    else
      render_errors @answer
    end
  end

  def destroy
    render json: @answer.destroy
  end

  ###
  # Batch Actions
  ###

  def batch_show
    authorize! :show, Answer
    render json: Answer
      .all
      .where(user: current_user)
      .where(question: Question.find(params[:question_id]))
      .are_answered
  rescue StandardError
    render json: { message: 'Question Answers Not Found!', status: 'error' }
  end

  def batch_yes_no
    authorize! :create, Answer
    batched = []
    params[:answers].each do |answer|
      batched << Answer.find_or_create_by(id: answer.try(:id)) do |ans|
        ans.user = current_user
        ans.question = Question.find(answer[:question])
        ans.answer = answer[:answer]
      end
    end
    render json: batched
  rescue StandardError
    render json: { message: 'Answers not Saved!', status: 'error' }
  end

  def batch_delete
    authorize! :delete, Answer
    deleted = []
    params[:answers].each do |answer|
      deleted << Answer.find(answer.try(:id)).destroy
    end
    render json: deleted
  rescue StandardError
    render json: { message: 'Answers not Deleted!', status: 'error' }
  end

  private

  def answer_params
    params.require(:answer).permit(
      :id,
      :answer,
      :user,
      :question
    )
  end
end
