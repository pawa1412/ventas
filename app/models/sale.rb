class Sale < ApplicationRecord
  belongs_to :client
  has_many :invoices, dependent: :destroy

  accepts_nested_attributes_for :invoices, :client, allow_destroy: true, reject_if: proc { |att| att['id'].blank? }
end
