class DiaryEntry < ActiveRecord::Base
  belongs_to :user

  def date_and_time_format(datetime)
    datetime.strftime("%Y-%m-%d %H:%M")
  end

  def wakeup_date
    if wakeup.nil?
      ""
    else
      self.wakeup.strftime("%Y-%m-%d")
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
