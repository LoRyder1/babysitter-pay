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
    round_and_convert
    @bedtime = 22
  end

  def round_and_convert
    @start = @start.round + 12
    @stop =  @stop.round + 24
  end

  def valid_schedule?
    @start >= 17 && @stop <= 28 
  end

  def bedtime_hours
    hours = @bedtime - @start
    hours > -1 ? hours : 0
  end

  def midnight_hours
    hours = 24 - @bedtime
    hours > -1 ? hours : 0
  end

  def twilight_hours
    hours = @stop - 24
    hours > -1 ? hours : 0
  end

  def total
    (12*bedtime_hours) + (8*midnight_hours) + (16*twilight_hours)
  end
end

# @sit1 = BabysitterPay.new(18.5, 26.25)

# 19, 26
# 3, 2, 2
# 36, 16, 32
# p @sit1.total

