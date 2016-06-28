require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/booking')

get '/booking/new' do
  erb( :new )
end  

post '/booking' do
  @booking = Booking.new(params)
  @booking.save()
  erb( :create )
end

get '/booking' do
  @booking = Booking.all()
  erb( :index )
end    
