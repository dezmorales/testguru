# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  def finished_tests(level)
    tests.where(level:)
  end
end
