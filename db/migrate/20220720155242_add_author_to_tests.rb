# frozen_string_literal: true

class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :user, null: false, index: true
  end
end
