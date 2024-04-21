require "test_helper"

class ParcelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save parcel without title" do
    parcel = Parcel.new
    assert_not parcel.save, "Saved the parel without a  title"
  end

  test "should not save parcel without first_name" do
    parcel = Parcel.new
    assert_not parcel.save, "Saved the parel without a  first_name"
  end

  test "check TransportParcel" do
  calculate = TransportPrice.new(11,2,2,2,"Westminster Abbey, Dean's Yard, London SW1P 3PA, United Kingdom","St John's Church, North End Rd, London SW6 1PB, United Kingdom")
      assert_equal(calculate.price().fetch(:weight),11.0)
      assert_equal(calculate.price().fetch(:length),2.0)
      assert_equal(calculate.price().fetch(:height),2.0)
      assert_equal(calculate.price().fetch(:width),2.0)
      assert_equal(calculate.price().fetch(:distance),6.5)
      assert_equal(calculate.price().fetch(:price),19.5)
  end
end
