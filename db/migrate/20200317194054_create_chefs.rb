class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string :company_name
      t.string :specialty
      t.string :location

      t.timestamps
    end
  end
end
