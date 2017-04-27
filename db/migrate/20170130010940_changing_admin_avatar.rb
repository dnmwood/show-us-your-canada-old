class ChangingAdminAvatar < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :avatar, :image
  end
end
