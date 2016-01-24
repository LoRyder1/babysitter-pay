require_relative 'babysitter'

describe BabysitterPay do
  before(:each) do
    @sitting = BabysitterPay.new(17,4)
  end

  describe 'start stop schedule' do
    it 'starts no earlier than 5pm is not valid' do
      expect(@sitting.valid_schedule?).to eq true
    end
  end
end