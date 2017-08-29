class CreateCompetenciasEmpresas < ActiveRecord::Migration
  def change
    create_table :competencias_empresas do |t|
      t.integer :habilidad
      t.integer :orotografia
      t.integer :mejora_procesos
      t.integer :trabajo_equipo
      t.integer :habilidad_tiempo
      t.integer :seguridad_personal
      t.integer :facilidad_palabra
      t.integer :gestion_proyecto
      t.integer :puntualidad
      t.integer :cumplimiento
      t.integer :integracion
      t.integer :creatividad
      t.integer :liderazgo
      t.integer :adaptacion_cambios
      t.integer :exelente
      t.integer :muy_bueno
      t.integer :bueno
      t.integer :regular
      t.integer :malo
      t.string :sugerencia_mejora
      t.string :comentario

      t.timestamps null: false
    end
  end
end
