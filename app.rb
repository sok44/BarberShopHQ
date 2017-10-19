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

class Contact < ActiveRecord::Base 
end


before do
  #Синтаксис ActiveRecord
  @barbers = Barber.all.order "name"
end

get '/' do
  erb :index
end

get '/contacts' do
  erb :contact
end


get '/visit' do
  erb :visit
end

post '/visit' do
  
  #Ламерский код -- 
  #@username = params[:username] 
  #@phone = params[:phone]
  #@datetime = params[:datetime]
  #@barber = params[:barber]
  #@color = params[:color]
  
  #Client.create(name: @username, phone: @phone, datestamp: @datetime, barber: @barber, color: @color)
  #--

  #тру код --
  #для этого поменяли представление visit, изменили name у тегов
  c = Client.new params[:client]
  c.save
  #---
  erb "Вы записались! #{@username} спасибо что выбрали нас! 
    Ждем вас #{@datetime}. Ваш телефон #{@phone}. Ваш мастер #{@barber}. 
    Выбранный цвет покраски #{@color}."
end


