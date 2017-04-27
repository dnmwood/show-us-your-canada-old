class AddingNewForm < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :terms_conditions, :boolean
    add_column :emails, :opt_in, :boolean, :default => true
  end
end
