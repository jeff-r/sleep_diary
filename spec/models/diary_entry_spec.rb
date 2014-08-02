require 'spec_helper'

describe DiaryEntry do
  let(:entry) { DiaryEntry.new }

  describe "#sleep_duration_in_hours_as_string" do
    it "formats the duration" do
      entry = DiaryEntry.new
      entry.lights_out = Time.zone.local(2013, 10, 5, 23,0)
      entry.wakeup = Time.zone.local(2013, 10, 6, 8, 30)
      entry.sleep_duration_in_hours_as_string.should == "9.50"
    end
  end

  describe "#sleep_duration_in_hours" do
    it "finds the duration" do
      entry = DiaryEntry.new
      entry.lights_out = Time.zone.local(2013, 10, 5, 23,0)
      entry.wakeup = Time.zone.local(2013, 10, 6, 7, 0)
      entry.awake_duration = 30
      entry.sleep_duration_in_hours.should == 7.5
    end
  end

  describe "#wakeup_date" do
    it "returns a formatted date" do
      entry.wakeup = Time.zone.local(2013, 10, 5, 8, 45)
      entry.wakeup_date.should == "Sat 10-05"
    end

    it "returns an empty string for nil" do
      entry.wakeup_date.should == ""
    end
  end

  describe "#wakeup_time" do
    it "returns a formatted time" do
      entry.wakeup = Time.zone.local(2013, 10, 5, 8, 45)
      entry.wakeup_time.should == "08:45"
    end

    it "returns an empty string for nil" do
      entry.wakeup_time.should == ""
    end
  end

  describe "#lights_out_time" do
    it "returns a formatted time" do
      entry.lights_out = Time.zone.local(2013, 10, 5, 8, 45)
      entry.lights_out_time.should == "08:45"
    end

    it "returns an empty string for nil" do
      entry.lights_out_time.should == ""
    end
  end

  describe "#lights_out_formatted" do
    it "returns a formatted time" do
      entry.lights_out = Time.zone.local(2013, 10, 5, 8, 45)
      entry.lights_out_formatted.should == "2013-10-05 08:45"
    end

    it "returns an empty string when nil" do
      entry.lights_out_formatted.should == ""
    end
  end

  describe "#lights_out_formatted=" do
    it "takes a formatted time" do
      entry.lights_out_formatted = Time.zone.local(2013, 10, 5, 8, 45)
      entry.lights_out_formatted.should == "2013-10-05 08:45"
    end
  end

  describe "#waketime_formatted" do
    it "returns a formatted time" do
      entry.wakeup = Time.zone.local(2013, 10, 5, 8, 45)
      entry.wakeup_formatted.should == "2013-10-05 08:45"
    end

    it "returns an empty string when nil" do
      entry.wakeup_formatted.should == ""
    end
  end

  describe "#waketime_formatted=" do
    it "takes a formatted time" do
      entry.wakeup_formatted = Time.zone.local(2013, 10, 5, 8, 45)
      entry.wakeup_formatted.should == "2013-10-05 08:45"
    end
  end
end
