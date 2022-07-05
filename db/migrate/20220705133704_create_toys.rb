class CreateToys < ActiveRecord::Migration[6.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :price
      t.string :color

      t.timestamps
    end
  end
end
