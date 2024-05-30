class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :beds
      t.integer :baths
      t.integer :square_feet
      t.decimal :acres, precision: 5, scale: 2
      t.decimal :price, precision: 12, scale: 2
      t.integer :home_type
      t.integer :status

      t.timestamps
    end
  end
end
