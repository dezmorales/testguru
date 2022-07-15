# frozen_string_literal: true

class AddCategoriesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :title, false)
  end
end
