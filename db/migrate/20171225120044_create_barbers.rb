class CreateBarbers < ActiveRecord::Migration[5.1]
  def change
  	  	create_table :barbers do |t|
  	  	t.text :name

  		t.timestamps null: false
  	end

  	Barbers.create :name => 'Jesie'
  	Barbers.create :name => 'Walt'
  	Barbers.create :name => 'Gus'
  end
end
