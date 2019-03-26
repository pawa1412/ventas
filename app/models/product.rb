class Product < ApplicationRecord
  has_many :invoice_product_joins, dependent: :destroy
  has_many :invoices, through: :invoice_product_joins
end
