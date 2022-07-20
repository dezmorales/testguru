# frozen_string_literal: true

class User < ApplicationRecord
  has_many :finished_tests
  has_many :tests
  has_many :tests_users
  has_many :users, through: :tests_users

  def finished_tests(level)
    Test.where(level:)
        .joins('INNER JOIN finished_tests ON tests.id = finished_tests.test_id')
        .where(finished_tests: { user_id: id })
  end
end
