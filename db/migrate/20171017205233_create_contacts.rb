class CreateContacts < ActiveRecord::Migration[5.1]
	def change
		#Создаем таблицу контактов. Таблицу указывать с именем во мн. числе.
		#т.к. принято что имя таблицы во мн. числе, а сущности в ед.числе
		create_table :contacts do |t|
			#text - тип столбца
			t.text :adress
			t.text :phone
			t.text :email
		
			#специальный метод который добавляет автоматически 2 доп столбца даты created_at, updated_at
			t.timestamps
		end
	end
end
