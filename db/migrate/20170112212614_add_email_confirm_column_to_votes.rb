class AddEmailConfirmColumnToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :email_confirmed, :boolean, :default => false
    add_column :votes, :confirm_token, :string
  end
end
