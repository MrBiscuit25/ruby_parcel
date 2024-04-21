
require "./lib/file.rb"

describe TransportPrice do
  describe 'price' do 
    it "return the calculated price of transport service" do
  calculate = TransportPrice.new(11,2,2,2,"Westminster Abbey, Dean's Yard, London SW1P 3PA, United Kingdom","St John's Church, North End Rd, London SW6 1PB, United Kingdom")
      expect(calculate.price().fetch(:weight)).to eql(11.0)
      expect(calculate.price().fetch(:length)).to eql(2.0)
      expect(calculate.price().fetch(:height)).to eql(2.0)
      expect(calculate.price().fetch(:width)).to eql(2.0)
      expect(calculate.price().fetch(:distance)).to eql(6.6)
      expect(calculate.price().fetch(:price)).to eql(19.8)
    end
  end
end

