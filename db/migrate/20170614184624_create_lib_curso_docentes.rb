class CreateLibCursoDocentes < ActiveRecord::Migration
  def change
    create_table :lib_curso_docentes do |t|
      t.references :periodo_liberacion_curso, index: true, foreign_key: true
      t.integer :docente_id
      t.string :liberado
      t.string :fecha

      t.timestamps null: false
    end
  end
end
