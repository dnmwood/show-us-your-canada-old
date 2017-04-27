class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :name
      t.text :story
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
