# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render plain: 'Введены неверные данные'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: 'Вопрос удален'
  end

  def new; end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
