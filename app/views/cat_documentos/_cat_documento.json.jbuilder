json.extract! cat_documento, :id, :nom_documento, :estado, :etapa, :created_at, :updated_at
json.url cat_documento_url(cat_documento, format: :json)
