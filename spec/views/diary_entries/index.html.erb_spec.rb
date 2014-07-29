require 'spec_helper'

describe "diary_entries/index" do
  before(:each) do
    assign(:diary_entries, [
      stub_model(DiaryEntry,
        :notes => "MyText",
        :rating => 1
      ),
      stub_model(DiaryEntry,
        :notes => "MyText",
        :rating => 1
      )
    ])
  end

  it "renders a list of diary_entries" do
    pending
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
