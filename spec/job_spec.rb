require 'spec_helper'

describe Job do
  before :each do
    @job_1 = Job.new 1299.99, 3, 'food'
  end
  describe "#flat_markup" do
    it 'returns 5% of base price' do
      expect(@job_1.flat_markup).to eql(@job_1.base_price * 0.05)
    end

  end
end