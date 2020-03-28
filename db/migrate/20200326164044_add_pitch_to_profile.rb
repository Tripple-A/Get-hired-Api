# frozen_string_literal: true

class AddPitchToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :pitch, :string
  end
end
