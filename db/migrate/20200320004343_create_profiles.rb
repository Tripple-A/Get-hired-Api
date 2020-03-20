class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :company_name
      t.string :location
      t.string :specialty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
