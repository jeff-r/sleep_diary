json.array!(@diary_entries) do |diary_entry|
  json.extract! diary_entry, :id, :lights_out, :wakeup, :notes, :rating
  json.url diary_entry_url(diary_entry, format: :json)
end
