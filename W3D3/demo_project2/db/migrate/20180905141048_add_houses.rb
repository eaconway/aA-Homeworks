class AddHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.integer :address

      t.timestamps
    end
  end
end
