require 'spec_helper'

describe DiaryEntry do
  let(:entry) { DiaryEntry.new }

  describe "#wakeup_date" do
    it "returns a formatted date" do
      entry.wakeup = DateTime.new(2013, 10, 5, 8, 45)
      entry.wakeup_date.should == "2013-10-05"
    end

    it "returns an empty string for nil" do
      entry.wakeup_date.should == ""
    end
  end

  describe "#wakeup_time" do
    it "returns a formatted time" do
      entry.wakeup = DateTime.new(2013, 10, 5, 8, 45)
      entry.wakeup_time.should == "08:45"
    end

    it "returns an empty string for nil" do
      entry.wakeup_time.should == ""
    end
  end

  describe "#lights_out_time" do
    it "returns a formatted time" do
      entry.lights_out = DateTime.new(2013, 10, 5, 8, 45)
      entry.lights_out_time.should == "08:45"
    end

    it "returns an empty string for nil" do
      entry.lights_out_time.should == ""
    end
  end

  describe "#lights_out_formatted" do
    it "returns a formatted time" do
      entry.lights_out = DateTime.new(2013, 10, 5, 8, 45)
      entry.lights_out_formatted.should == "2013-10-05 08:45"
    end

    it "returns an empty string when nil" do
      entry.lights_out_formatted.should == ""
    end
  end

  describe "#lights_out_formatted=" do
    it "takes a formatted time" do
      entry.lights_out_formatted = DateTime.new(2013, 10, 5, 8, 45)
      entry.lights_out_formatted.should == "2013-10-05 08:45"
    end
  end

  describe "#waketime_formatted" do
    it "returns a formatted time" do
      entry.wakeup = DateTime.new(2013, 10, 5, 8, 45)
      entry.wakeup_formatted.should == "2013-10-05 08:45"
    end

    it "returns an empty string when nil" do
      entry.wakeup_formatted.should == ""
    end
  end

  describe "#waketime_formatted=" do
    it "takes a formatted time" do
      entry.wakeup_formatted = DateTime.new(2013, 10, 5, 8, 45)
      entry.wakeup_formatted.should == "2013-10-05 08:45"
    end
  end
end
