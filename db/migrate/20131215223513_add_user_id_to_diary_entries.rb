class AddUserIdToDiaryEntries < ActiveRecord::Migration
  def change
    add_column :diary_entries, :user_id, :integer
  end
end
