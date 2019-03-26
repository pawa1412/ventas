class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :tipo
      t.string :marca
      t.string :modelo
      t.integer :precio
      t.integer :numero_producto

      t.timestamps
    end
  end
end
