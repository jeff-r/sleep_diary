class CreateDiaryEntries < ActiveRecord::Migration
  def change
    create_table :diary_entries do |t|
      t.datetime :lights_out
      t.datetime :wakeup
      t.text :notes
      t.integer :rating

      t.timestamps
    end
  end
end
