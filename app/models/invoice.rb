class Invoice < ApplicationRecord
  belongs_to :sale
  has_many :invoice_product_joins, dependent: :destroy
  has_many :products, through: :invoice_product_joins

  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: proc { |att| att['id'].blank? }
end
