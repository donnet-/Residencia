class CreateDesemLaborales < ActiveRecord::Migration
  def change
    create_table :desem_laborales do |t|
      t.string :eficincia
      t.string :calificacion_academica
      t.string :utilidad_residencia
      t.integer :area_estudio
      t.integer :titulacion
      t.integer :experiencia_laboral
      t.integer :posicionamiento
      t.integer :conocimiento_idioma
      t.integer :recomendaciones
      t.integer :personalidad_actitud
      t.integer :otros

      t.timestamps null: false
    end
  end
end
