class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :client, foreign_key: true
      t.string :codigo_oc
      t.integer :numero_licitacion
      t.date :fecha_envio
      t.string :estado
      t.string :moneda
      t.integer :total
      t.string :forma_pago

      t.timestamps
    end
  end
end
