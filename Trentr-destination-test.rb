require 'test/unit'
require_relative 'Trentr-destination'

class TravelTest < Test::Unit::TestCase
  def test_destination
    dest_test = Destination.new('Paris', 'eiffel.jpg', 'Sydney', '1.00pm')

    assert_equal('Paris', dest_test.name)
    assert_equal('eiffel.jpg', dest_test.image)
    assert_equal('Sydney', dest_test.place)
    assert_equal('1.00pm', dest_test.time)
  end

  def test_destination2
    dest_test2 = Destination.new('London', 'bigben.jpg', 'Sydney', '2.00pm')

    assert_equal('London', dest_test2.name)
    assert_equal('bigben.jpg', dest_test2.image)
    assert_equal('Sydney', dest_test2.place)
    assert_equal('2.00pm', dest_test2.time)
  end
end
