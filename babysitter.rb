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
  attr_reader :start, :stop
  def initialize start, stop
    @start, @stop = start, stop
    round
    @bedtime = 22
  end

  def round
    @start = @start.round
    @stop =  @stop.round
  end

  def valid_schedule?
    @start >= 17 && @stop <= 28 
  end

  def bedtime_hours
    @bedtime - @start
  end

  def midnight_hours
    24 - @bedtime
  end

  def twilight_hours
    @stop - 24
  end

  def total
    (12*bedtime_hours) + (8*midnight_hours) + (16*twilight_hours)
  end
end

# 60 + 16 + 64
