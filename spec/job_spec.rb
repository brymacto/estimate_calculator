require 'spec_helper'

describe Job do
  before :each do
    @job_1 = Job.new 1299.99, 3, 'food'
    @job_2 = Job.new 5432.00, 1, 'drugs'
    @job_3 = Job.new 12456.95, 4, 'books'
    @job_4 = Job.new 1213.00, 3, 'electronics'
    @jobs = [@job_1, @job_2, @job_3, @job_4]
  end
  describe "#flat_markup" do
    it 'returns 5% of base price' do
      expect(@job_1.flat_markup).to eql(@job_1.base_price * 0.05)
    end
  end

  describe "#price_with_flat_markup" do
    it 'returns base price + flat markup' do
      expect(@job_1.price_with_flat_markup).to eql(@job_1.base_price + @job_1.flat_markup)
    end
  end

  describe "#people_markup" do
    it 'returns 1.2% of price_with_flat_markup for each person' do
      expect(@job_1.people_markup).to eql(@job_1.price_with_flat_markup * 0.012 * @job_1.people)
    end
  end

  describe "#type_markup" do
    context 'type is drugs' do
      it 'returns 7.5%' do
        expect(@job_2.type_markup).to eql(@job_2.price_with_flat_markup * 0.075)
      end
    end
    context 'type is food' do
      it 'returns 13%' do
        expect(@job_1.type_markup).to eql(@job_1.price_with_flat_markup * 0.13)
      end
    end
    context 'type is electronics' do
      it 'returns 2%' do
        expect(@job_4.type_markup).to eql(@job_2.price_with_flat_markup * 0.02)
      end
    end
    context 'type is none of the above' do
      it 'returns 0%' do
        expect(@job_2.type_markup).to eql(0)
      end
    end
  end

  describe "#total_price" do
    it 'returns sum of base_price and markups' do
      @jobs.each do |job|
        expect(job.total_price).to eql(job.base_price + job.flat_markup + job.people_markup + job.type_markup)
      end
    end
  end
end