json.extract! sale, :id, :client_id, :codigo_oc, :numero_licitacion, :fecha_envio, :estado, :moneda, :total, :forma_pago, :created_at, :updated_at
json.url sale_url(sale, format: :json)
