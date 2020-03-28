# frozen_string_literal: true

class AddVendorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :vendor, :boolean, default: false, null: false
  end
end
