class BackToPostal < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :city, :postal_code
  end
end
