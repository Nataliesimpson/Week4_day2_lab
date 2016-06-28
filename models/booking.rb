require( 'pg' )

class Booking

  attr_reader( :id, :first_name, :last_name, :number_of_nights, :breakfast, :room_type)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @number_of_nights = options['number_of_nights'].to_i
    @breakfast = options['breakfast']
    @room_type = options['room_type']
  end  

  def self.all
    db = PG.connect( {dbname: 'bookings', host: 'localhost' })
    sql = "SELECT * FROM bookings"
    bookings = db.exec(sql)

    result = bookings.map {|booking| Booking.new(booking)}
    
    db.close
    return result
  end  

  def save
    db = PG.connect( {dbname: 'bookings', host: 'localhost' })
    sql = "INSERT INTO bookings (
      first_name,
      last_name,
      number_of_nights,
      breakfast,
      room_type
    ) VALUES (
        '#{ @first_name }',
        '#{ @last_name }',
        '#{ @number_of_nights }',
        '#{ @breakfast }',
        '#{ @room_type }'
    ) RETURNING *"
    booking_data = db.exec(sql)
    db.close
    @id = booking_data.first()['id'].to_i
  end 

  def full_name()
    return @first_name.concat(" #{@last_name}")
  end  

  def total_cost()
    return @number_of_nights * 50
  end  


end  









