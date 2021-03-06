class DiaryEntry < ActiveRecord::Base
  belongs_to :user

  def running_average(nights)
    entries = DiaryEntry.where("lights_out < '#{self.lights_out}'").order(lights_out: :desc).limit(nights)
    return sleep_duration_in_hours_as_string if entries.count == 0
    hours = entries.inject(0) { |sum, entry| sum + entry.sleep_duration_in_hours }
    hours = hours / entries.count
    "%.2f" % (hours)
  end

  def next
    self.class.unscoped.where('id > ?', id).first
  end

  def prev
    self.class.unscoped.where('id < ?', id).last
  end

  def date_and_time_format(datetime)
    datetime.strftime("%Y-%m-%d %H:%M")
  end

  def sleep_duration_in_hours_as_string
    hours = sleep_duration_in_hours
    "%.2f" % (hours)
  end

  def sleep_duration_in_hours
    duration_in_seconds = wakeup - lights_out
    duration_in_seconds -= awake_duration*60 if awake_duration
    duration_in_seconds -= time_to_sleep*60 if time_to_sleep
    duration_in_hours = duration_in_seconds / 3600
  end

  def wakeup_date
    if wakeup.nil?
      ""
    else
      self.wakeup.strftime("%a %m-%d")
    end
  end

  def wakeup_time
    if wakeup.nil?
      ""
    else
      self.wakeup.strftime("%H:%M")
    end
  end

  def lights_out_time
    if lights_out.nil?
      ""
    else
      self.lights_out.strftime("%H:%M")
    end
  end

  def wakeup_formatted=(value)
    self.wakeup = value
  end

  def wakeup_formatted
    if wakeup.nil?
      ""
    else
      date_and_time_format(wakeup)
    end
  end

  def lights_out_formatted
    if lights_out.nil?
      ""
    else
      date_and_time_format(lights_out)
    end
  end

  def lights_out_formatted=(value)
    self.lights_out = value
  end
end
