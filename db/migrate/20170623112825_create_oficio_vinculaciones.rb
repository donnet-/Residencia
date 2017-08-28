class CreateOficioVinculaciones < ActiveRecord::Migration
  def change
    create_table :oficio_vinculaciones do |t|
      t.integer :numOficio
      t.string :anio
      t.date :fecha
      t.integer :proyecto_id
      t.integer :proyecto_docente_id
      t.integer :proyecto_estudiante_id
      t.string :lema
      t.integer :plan_estudio_id
      t.string :jefeDpto
      t.string :jefeVinculacion
      t.string :subAcademico

      t.timestamps null: false
    end
  end
end
