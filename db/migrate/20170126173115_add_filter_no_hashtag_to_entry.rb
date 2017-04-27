class AddFilterNoHashtagToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :filter_no_hashtag, :string
  end
end
