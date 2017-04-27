class AddEmailToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :email, :string
  end
end
