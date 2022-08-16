# frozen_string_literal: true

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end


