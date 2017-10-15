class CreateClients < ActiveRecord::Migration[5.1]
	def change
  	 	#Создаем таблицу клинетов. Надо проверить:тут мы указываем сущность в ед. числе, а таблица создастся с именем во мн. числе.
	  	create_table :client do |t|
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
