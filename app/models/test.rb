# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :finished_tests
  belongs_to :category
  has_many :questions
  belongs_to :user
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_by_category(name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: name })
        .order(title: :desc).pluck(:title)
  end
end
