# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    header = "#{question.test.title} Question"
    question.new_record? ? "Create New #{header}" : "Edit #{header}"
  end
end
