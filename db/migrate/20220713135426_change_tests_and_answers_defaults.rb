# frozen_string_literal: true

class ChangeTestsAndAnswersDefaults < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:tests, :level, 1)
    change_column_default(:answers, :correct, false)
  end
end
