require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, 'sqlite3:_database.db'

class Clients < ActiveRecord::Base
	# VALIDATIONS
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
end

class Barbers < ActiveRecord::Base
end

before do
	@barber = Barbers.all
end

get '/' do
	#@barber = Barbers.all
	@barbers = Barbers.order "created_at DESC" 
	erb :index
end

get '/visit' do
	erb :visit_v2
end

post '/visit' do
	c = Clients.new params[:clients]
	if c.save
		erb "<h2> Recording... </h2>"
	else
		erb "<h2> Erroroo... </h2>"
	end
end




# post '/visit' do
# 	@username = params[:username]
# 	@phone = params[:phone]
# 	@datetime = params[:datetime]
# 	@barbers = params[:barbers]

# 	c = Clients.new

# 	c.name = @username
# 	c.phone = @phone
# 	c.datestamp = @datetime
# 	c.barber = @barbers
# 	c.save # данные будут записаны

# 	erb "<h2> Recording... </h2>"

# 	hh =    {
# 			:username => 'Please, enter your name',
# 			:phone => 'Please, enter your phone', 
# 			:datetime => 'Please, enter visit day & time'
# 			}

# 	@error = hh.select {|key,_| params[key] == ""}.values.join("; ")

# 	if @error != ''
# 		return erb :visit
# 	end
# end