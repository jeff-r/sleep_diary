class AddTimeToSleepToDiaryEntry < ActiveRecord::Migration
  def change
    add_column :diary_entries, :time_to_sleep, :integer
  end
end
