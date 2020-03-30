# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
