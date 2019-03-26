json.extract! product, :id, :tipo, :marca, :modelo, :precio, :numero_producto, :created_at, :updated_at
json.url product_url(product, format: :json)
