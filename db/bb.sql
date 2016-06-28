DROP TABLE bookings;

CREATE TABLE bookings (
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  number_of_nights INT2,
  breakfast VARCHAR(255),
  room_type VARCHAR(255)
);