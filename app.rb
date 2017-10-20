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
  #Валидация
  # если последним параметром идет хеш то фигурные скобки можно опускать и просто перечилять через запятую
  validates :name, presence: true, length: { minimum: 3}
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
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
  @c = Client.new
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
  #для этого поменяли представление visit, изменили name у тегов на client[имя совпадающее с именем поля в моделт]
  @c = Client.new params[:client]
  if @c.save
    erb "Вы записались! #{@username} спасибо что выбрали нас! 
      Ждем вас #{@datetime}. Ваш телефон #{@phone}. Ваш мастер #{@barber}. 
      Выбранный цвет покраски #{@color}."
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
  #---
end

get '/barber/:id' do
  erb :barber

end


