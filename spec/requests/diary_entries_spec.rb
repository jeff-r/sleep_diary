require 'spec_helper'

describe "DiaryEntries" do
  describe "GET /diary_entries" do
    it "works! (now write some real specs)" do
      pending
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get diary_entries_path
      response.status.should be(200)
    end
  end
end
