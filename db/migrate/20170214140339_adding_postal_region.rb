class AddingPostalRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :postal_code, :string
    add_column :entries, :location, :string
  end
end
