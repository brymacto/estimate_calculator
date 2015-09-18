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

  describe "#people_markup" do
    it 'returns 1.2% of price_with_flat_markup for each person' do

    end
  end

  describe "#type_markup" do
    context 'type is drugs' do
      it 'returns 7.5%' do

      end
    end
    context 'type is food' do
      it 'returns 13%' do

      end
    end
    context 'type is electronics' do
      it 'returns 2%' do

      end
    end
    context 'type is none of the above' do
      it 'returns 0%' do

      end
    end
  end

  describe "#total_price" do
    it 'returns sum of base_price and markups' do

    end
  end
end