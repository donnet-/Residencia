class CreateAprendizajeEgresados < ActiveRecord::Migration
  def change
    create_table :aprendizaje_egresados do |t|
      t.string :calidad_docente
      t.string :plan_estudio
      t.string :proyecto_investigacion
      t.string :condiciones_estudio
      t.string :experiencia

      t.timestamps null: false
    end
  end
end
