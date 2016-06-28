require( 'minitest/autorun' )
require_relative( '../models/booking' )

class TestBooking < MiniTest::Test

  def setup
    options = {
      'first_name' => 'Russell', 
      'last_name' => 'Williams', 
      'number_of_nights' => '3', 
      'breakfast' => 'yes',
      'room_type' => 'single'
      }

    @booking = Booking.new( options )
  end

  def test_first_name()
    assert_equal( 'Russell', @booking.first_name() )
  end

  def test_second_name()
    assert_equal( 'Williams', @booking.last_name() )
  end
  
  def test_full_name()
    assert_equal( 'Russell Williams', @booking.full_name() )
  end
  
  def test_number_of_nights()
    assert_equal( 3, @booking.number_of_nights() )
  end
  
  def test_breakfast()
    assert_equal( 'yes', @booking.breakfast() )
  end
  
  def test_room_type()
    assert_equal( 'single', @booking.room_type() )
  end    

  def test_total_cost()
    assert_equal( 150, @booking.total_cost() )
  end  



end    









