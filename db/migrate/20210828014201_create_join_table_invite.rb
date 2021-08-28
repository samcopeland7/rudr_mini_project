class CreateJoinTableInvite < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :events, table_name: :invites do |t|
      t.string :response
    
      # t.index [:user_id, :event_id]
      # t.index [:event_id, :user_id]
    end

    add_foreign_key :invites, :events, on_delete: :cascade
  end
end
