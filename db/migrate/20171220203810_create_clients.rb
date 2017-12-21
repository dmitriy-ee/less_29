class CreateClients < ActiveRecord::Migration[5.1]
  def change
  	create_table :clients do |t|
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.timestamps null: false
  	end
  end
end
