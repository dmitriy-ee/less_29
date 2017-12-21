require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, 'sqlite3:_database.db'

class Clients < ActiveRecord::Base
end

class Barbers < ActiveRecord::Base
end

before do
	@barbers = Barbers.all
end

get '/' do
	#@barbers = Barbers.all
	@barbers = Barbers.order "created_at DESC" 
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barbers = params[:barbers]

	hh =    {
			:username => 'Please, enter your name',
			:phone => 'Please, enter your phone', 
			:datetime => 'Please, enter visit day & time'
			}

	@error = hh.select {|key,_| params[key] == ""}.values.join("; ")

	if @error != ''
		return erb :visit
	end
end