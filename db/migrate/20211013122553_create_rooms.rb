class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity 
      t.integer :cost
      t.integer :bed_no
      t.string :bed_type 
      t.timestamps
    end
  end
end
