class AddLogoToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :logo, :string, default: :null
  end
end
