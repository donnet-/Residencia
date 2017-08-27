class CreateLiberacioDocenteCursos < ActiveRecord::Migration
  def change
    create_table :liberacio_docente_cursos do |t|
      t.references :liberacion_curso, index: true, foreign_key: true
      t.integer :docente_id
      t.date :fecha
      t.string :dosificacion
      t.string :instrumentacion
      t.string :cumplimiento
      t.string :calificacion
      t.string :reporteFinal
      t.string :apoyo
      t.string :liberacion
      t.string :jefeAcad
      t.string :subdirector

      t.timestamps null: false
    end
  end
end
