class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :neighborhood

      t.timestamps
    end
  end
end
