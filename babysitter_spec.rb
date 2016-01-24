require_relative 'babysitter'

describe BabysitterPay do
  before(:each) do
    @sitting = BabysitterPay.new(17,28)
  end

  describe 'start stop schedule' do
    it 'start time earlier than 5pm or later than 4am is not valid' do
      expect(@sitting.valid_schedule?).to eq true
    end
  end

  describe 'counting hours' do
    it 'counts from start to bedtime hours' do
      expect(@sitting.bedtime_hours).to eq 5
    end

    it 'counts from bedtime to midnight hours' do
      expect(@sitting.midnight_hours).to eq 2
    end

    it 'counts from midnight to end' do
      expect(@sitting.twilight_hours).to eq 4
    end
  end
end