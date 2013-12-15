require 'spec_helper'

describe "diary_entries/new" do
  before(:each) do
    assign(:diary_entry, stub_model(DiaryEntry,
      :notes => "MyText",
      :rating => 1
    ).as_new_record)
  end

  it "renders new diary_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diary_entries_path, "post" do
      assert_select "textarea#diary_entry_notes[name=?]", "diary_entry[notes]"
      assert_select "input#diary_entry_rating[name=?]", "diary_entry[rating]"
    end
  end
end
