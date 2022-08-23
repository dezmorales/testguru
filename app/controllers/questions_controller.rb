# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: :show
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  private

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
