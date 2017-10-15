class CreateBarbers < ActiveRecord::Migration[5.1]
  	def change
		#Создаем таблицу ПАРИКМАХЕРОВ. Таблицу указывать с именем во мн. числе.
		#т.к. принято что имя таблицы во мн. числе, а сущности в ед.числе
		create_table :barbers do |t|
			#text - тип столбца
			t.text :name

			#специальный метод который добавляет автоматически 2 доп столбца даты created_at, updated_at
			t.timestamps
		end

		#Тут же можно наполнить таблицу если их еще нет
		Barber.create :name => 'Стригун'
		Barber.create :name => 'Оболванщик'
		Barber.create :name => 'Бродобрей'
	end
end
