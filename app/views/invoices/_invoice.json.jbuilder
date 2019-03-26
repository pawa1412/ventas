json.extract! invoice, :id, :sale_id, :fecha_despacho, :orden_transporte, :empresa, :numero_factura, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
