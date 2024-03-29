# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: :User, foreign_key: :author_id

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :timer, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :published, -> { where(published: true ) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :category_name, ->(name) { joins(:category).where(category: { title: name }) }

  def self.tests_by_category(name)
    category_name(name).order(title: :desc).pluck(:title)
  end
end
