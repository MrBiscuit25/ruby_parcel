
# print 'Enter weight in kilograms: '
# weight = gets.chomp
# print 'Enter length in meters: '
# length= gets.chomp
# print 'Enter width in meters: '
# width= gets.chomp
# print 'Enter height in meters: '
# height= gets.chomp
# print 'Enter origin : '
# origins= gets.chomp
# print 'Enter destination: '
# destinations= gets.chomp


require 'uri'
require 'net/http'
require 'json'

class TransportPrice
  def initialize(weight,length,width,height,origins,destinations)
    @weight = weight.to_f
    @length = length.to_f
    @width =width.to_f
    @height = height.to_f
    @origins = origins
    @destinations = destinations
    @uri =
      URI("https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{@origins}&destinations=#{@destinations}&key=Py0zkhYg0SYBRecRGktz33CrUWO0SRHsEclcbS2sMXmRqEpcKrn4ehMh83SqlHTI")
    @response = Net::HTTP.get_response(@uri)
    @temp = JSON.parse(@response.body)
    @volume = @length * @width * @height
    @distance = @temp.dig('rows',0,'elements',0,'distance','text').to_f
    
    if @volume <= 1 
      @priceByKilometer = 1
    elsif @volume > 1 && @weight <= 10
      @priceByKilometer = 2
    elsif @volume > 1 && @weight > 10
      @priceByKilometer = 3
    end
    @price = @distance * @priceByKilometer
  end
  def price
    return {weight:@weight,length:@length ,height:@height,
      width:@width,distance:@distance,price:@price.round(2),
    } 
  end
end

# obj = TransportPrice.new(weight,length,width,height,origins,destinations)
# p obj.price()


# object = TransportPrice.new(11,2,2,2,"Westminster Abbey, Dean's Yard, London SW1P 3PA, United Kingdom","St John's Church, North End Rd, London SW6 1PB, United Kingdom")
# p object.price()
# {:weight=>11.0, :length=>2.0, :height=>2.0, :width=>2.0, :distance=>6.5, :price=>19.5, :priceByKm=>3}

