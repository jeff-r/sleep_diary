require 'spec_helper'

describe "diary_entries/show" do
  before(:each) do
    @diary_entry = assign(:diary_entry, stub_model(DiaryEntry,
      :notes => "MyText",
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
