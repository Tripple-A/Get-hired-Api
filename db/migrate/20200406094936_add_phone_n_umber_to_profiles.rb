class AddPhoneNUmberToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :phone_number, :integer, limit: 8
  end
end
