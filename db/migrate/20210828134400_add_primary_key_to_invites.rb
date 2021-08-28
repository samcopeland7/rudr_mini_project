class AddPrimaryKeyToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :invite_id, :primary_key
  end
end
