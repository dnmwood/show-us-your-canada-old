class AddingQuiz < ActiveRecord::Migration[5.0]
  def change
    create_table :quizes do |t|
      t.integer :entry_id
      t.integer :user_id
      t.string :quiz_ip
      t.string :email
      t.boolean :email_confirmed, default: false
      t.string :confirm_token
      t.timestamps
    end
  end
end
