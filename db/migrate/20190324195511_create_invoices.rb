class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :sale, foreign_key: true
      t.date :fecha_despacho
      t.string :orden_transporte
      t.string :empresa
      t.integer :numero_factura

      t.timestamps
    end
  end
end
