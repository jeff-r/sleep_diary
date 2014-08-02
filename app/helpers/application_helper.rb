module ApplicationHelper
  def short_date(date)
    date.strftime("%a %m-%d")
  end

  def short_time(date)
    date.strftime("%H:%M")
  end

  def day_only(date)
    date.strftime("%A")
  end

  def date_only(date)
    date.strftime("%m-%d")
  end

  def month_only(date)
    date.strftime("%B")
  end

  def month_if_new(entry, prev_entry)
    return month_only(entry.wakeup) if prev_entry.nil?
    entry_string      = month_only(entry.wakeup)
    prev_entry_string = month_only(prev_entry.wakeup)
    if entry_string == prev_entry_string
      ""
    else
      month_only(entry.wakeup)
    end
  end
end
