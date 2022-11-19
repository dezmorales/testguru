class Badge < ApplicationRecord
  enum rule: {
    all_by_category: 0,
    on_first_try: 1,
    all_by_level: 2
  }

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image, :rule, :subject_name, presence: true
  validate :comparison_subject_name_and_test_name, if: :on_first_try?
  validate :comparison_subject_name_and_category_name, if: :all_by_category?
  validate :comparison_subject_name_and_level, if: :all_by_level?

  def comparison_subject_name_and_test_name
    errors.add(:subject_name, "doesn't exist") unless Test.where(title: subject_name).present?
  end

  def comparison_subject_name_and_category_name
    errors.add(:subject_name, "doesn't exist") unless Category.where(title: subject_name).present?
  end

  def comparison_subject_name_and_level
    errors.add(:subject_name, "doesn't exist" ) unless Test.where(level: subject_name).present?
  end
end
