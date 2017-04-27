class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string "name"
      t.text "story"
      t.string "avatar"
      t.string "filter"
      t.string "title"
      t.timestamps
    end
  end
end
