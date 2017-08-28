json.extract! perfil_egresado, :id, :nombre, :fk_numControl, :fecha_nac, :curp, :sexo, :edo_civil, :direccion, :telefon, :email, :egresado_especialidad, :fecha_egresado, :titulo, :dominio_ingles, :idioma_otro, :m_software, :created_at, :updated_at
json.url perfil_egresado_url(perfil_egresado, format: :json)
