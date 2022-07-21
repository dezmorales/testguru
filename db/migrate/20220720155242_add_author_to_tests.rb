# frozen_string_literal: true

class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, null: false, index: true, foreign_key: { to_table: :users }
  end
end
