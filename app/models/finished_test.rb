# frozen_string_literal: true

class FinishedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
