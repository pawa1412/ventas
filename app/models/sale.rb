class Sale < ApplicationRecord
  belongs_to :client
  has_many :invoices, dependent: :destroy
end
