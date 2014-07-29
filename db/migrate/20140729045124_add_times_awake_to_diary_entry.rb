class AddTimesAwakeToDiaryEntry < ActiveRecord::Migration
  def change
    add_column :diary_entries, :times_awake, :integer
  end
end
