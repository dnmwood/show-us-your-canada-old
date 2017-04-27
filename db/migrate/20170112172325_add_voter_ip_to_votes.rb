class AddVoterIpToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :voter_ip, :string
  end
end
