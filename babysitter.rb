# - starts no earlier than 5:00PM
# - leaves no later than 4:00AM
# - gets paid $12/hour from start-time to bedtime
# - gets paid $8/hour from bedtime to midnight
# - gets paid $16/hour from midnight to end of job
# - gets paid for full hours (no fractional hours)


# Feature:
# As a babysitter
# In order to get paid for 1 night of work
# I want to calculate my nightly charge

class BabysitterPay
  def initialize start, stop
    @start, @stop = start, stop
    @bedtime = 22
  end

  def valid_schedule?
    @start >= 17 && @stop <= 28 
  end

  def bedtime_hours
    @bedtime - @start
  end
end

