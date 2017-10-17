class CreateClients < ActiveRecord::Migration[5.1]
	def change
  	 	#Создаем таблицу клинетов. Таблицу указывать с именем во мн. числе.
		#т.к. принято что имя таблицы во мн. числе, а сущности в ед.числе
	  	create_table :clients do |t|
	  		#text - тип столбца
	  		t.text :name
	  		t.text :phone
	  		t.text :datestamp
	  		t.text :barber
	  		t.text :color

	  		#специальный метод который добавляет автоматически 2 доп столбца даты created_at, updated_at
	  		t.timestamps
	  	end
  	end
end
