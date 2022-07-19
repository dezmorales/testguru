# frozen_string_literal: true

class User < ApplicationRecord
  def finished_tests(level)
    Test.where(level: level)
        .joins('INNER JOIN finished_tests ON tests.id = finished_tests.test_id')
        .where(finished_tests: { user_id: id })
  end
end
