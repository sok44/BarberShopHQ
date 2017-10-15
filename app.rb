require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Работа с activerecord

#1. Создаем подключение к базе данных
set :database, "sqlite3:barbershop.db"

#2. Создаем сущности как класс наследуемый от  ActiveRecord::Base (клиент, заказы, )
#mapping или отражение 
class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base
end

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

