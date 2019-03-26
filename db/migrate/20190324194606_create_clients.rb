class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :rut
      t.string :unidad_compra
      t.string :razon
      t.string :direccion
      t.string :comuna
      t.string :region
      t.string :institucion

      t.timestamps
    end
  end
end
