class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.integer :potential_customer_id
      t.integer :potential_vendor_id
      t.timestamps
    end
  end
end
