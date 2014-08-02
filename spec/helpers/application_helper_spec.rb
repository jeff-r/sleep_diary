require 'spec_helper'
require "ostruct"

# Specs in this file have access to a helper object that includes
# the DiaryEntriesHelper. For example:
#
# describe DiaryEntriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
  describe "#short_date" do
    it "formats a date without the year" do
      date = Time.zone.local(2013, 10, 5, 8, 45)
      expect(helper.short_date(date)).to eql("Sat 10-05")
    end
  end

  describe "#short_date" do
    it "formats a time without the date" do
      date = Time.zone.local(2013, 10, 5, 8, 45)
      expect(helper.short_time(date)).to eql("08:45")
    end
  end

  describe "#day_only" do
    it "formats a time just the day of the week" do
      date = Time.zone.local(2013, 10, 5, 8, 45)
      expect(helper.day_only(date)).to eql("Saturday")
    end
  end

  describe "#date_only" do
    it "formats a time just the date" do
      date = Time.zone.local(2013, 10, 5, 8, 45)
      expect(helper.date_only(date)).to eql("10-05")
    end
  end

  describe "#month_if_new" do
    let(:today) { OpenStruct.new(wakeup: Time.zone.local(2013, 10, 5, 8, 45)) }

    it "returns the month if the previous date is nil" do
      prev_date = nil
      expect(helper.month_if_new(today, prev_date)).to eql("October")
    end

    it "returns the month if it's a new month" do
      prev_date = OpenStruct.new(wakeup: Time.zone.local(2013, 9, 4, 8, 45))
      expect(helper.month_if_new(today, prev_date)).to eql("October")
    end

    it "returns an empty string if it's the same month" do
      prev_date = OpenStruct.new(wakeup: Time.zone.local(2013, 10, 5, 8, 45))
      expect(helper.month_if_new(today, prev_date)).to eql("")
    end

  end
end
