class AddAttendedToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :attended, :boolean, default: false
  end
end
