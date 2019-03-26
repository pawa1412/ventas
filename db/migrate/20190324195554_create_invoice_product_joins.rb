class CreateInvoiceProductJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_product_joins do |t|
      t.references :product, foreign_key: true
      t.references :invoice, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
