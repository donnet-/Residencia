json.extract! solicitud_observacion, :id, :rfc, :observacion, :solicitud_id, :created_at, :updated_at
json.url solicitud_observacion_url(solicitud_observacion, format: :json)
