require 'spec_helper'

describe "diary_entries/edit" do
  before(:each) do
    @diary_entry = assign(:diary_entry, stub_model(DiaryEntry,
      :notes => "MyText",
      :rating => 1
    ))
  end

  it "renders the edit diary_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diary_entry_path(@diary_entry), "post" do
      assert_select "textarea#diary_entry_notes[name=?]", "diary_entry[notes]"
      assert_select "input#diary_entry_rating[name=?]", "diary_entry[rating]"
    end
  end
end
