# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> {where(correct: true)}

  validates :body, presence: true
  validates :validate_number_of_answers

  private

  def validate_number_of_answers
    errors.add(:number_answers) if question.answers.count > 4
  end
end
