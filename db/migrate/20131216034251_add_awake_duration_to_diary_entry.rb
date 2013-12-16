class AddAwakeDurationToDiaryEntry < ActiveRecord::Migration
  def change
    add_column :diary_entries, :awake_duration, :integer
  end
end
