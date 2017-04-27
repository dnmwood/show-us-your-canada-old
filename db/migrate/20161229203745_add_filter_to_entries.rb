class AddFilterToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :filter, :string
  end
end
