class ChangingPostalCodeToCity < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :postal_code, :city
  end
end
