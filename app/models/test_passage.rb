# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question
  before_update :update_completed

  PERCENTAGE_PASSAGE = 85

  def success_passage
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def successful?
    success_passage >= PERCENTAGE_PASSAGE && !time_over?
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def question_number
    self.test.questions.order(:id).index(current_question) + 1
  end

  def current_progress
    questions_count = test.questions.order(:id).index(current_question)
    (questions_count.to_f / test.questions.count * 100).round
  end

  def time_over?
    return false if test.timer.nil?

    created_at + test.timer.minutes < Time.zone.now
  end

  private

  def update_completed
    self.completed = true if successful?
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first rescue nil
  end
end

