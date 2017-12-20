require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set database, "sqlite3:_database.db"

class Client < ActiveRecord::Base
end