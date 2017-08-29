json.extract! datos_generales_empresa, :id, :nombre_empresa, :calle, :numero, :colonia, :cp, :ciudad, :estado, :municipio, :telefono, :correo, :tipo_empresa, :tam_empresa, :actividad_economica, :created_at, :updated_at
json.url datos_generales_empresa_url(datos_generales_empresa, format: :json)
