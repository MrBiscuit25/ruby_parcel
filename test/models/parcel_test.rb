require "test_helper"

class ParcelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save parcel without title" do
    parcel = Parcel.new
    assert_not parcel.save, "Saved the parel without a  title"
  end
end
