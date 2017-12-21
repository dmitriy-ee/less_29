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

get '/' do
	@barbers = Barbers.all 
	erb :index
end