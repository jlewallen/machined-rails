module MachinedRails::Helpers
  module TimeHelper
    def to_time_string(seconds)
      hours = seconds / 3600
      seconds -= hours * 3600
      minutes = seconds / 60
      seconds -= minutes * 60
      if hours > 0
        "%d hour(s) %02d:%02d" % [hours, minutes, seconds]
      else
        "%02d:%02d" % [minutes, seconds]
      end
    end

    def time_of_day(seconds)
      hours = 0
      minutes = 0
      if seconds > 0
        hours = seconds / 3600
        seconds -= hours * 3600
        minutes = seconds / 60
      end
      hours = 0 if hours >= 24
      Time.local(2000, "Jan", 1, hours, minutes, 0).to_s(:time_only)
    end
  end
end
