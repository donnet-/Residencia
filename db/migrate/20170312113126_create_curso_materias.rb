class CreateCursoMaterias < ActiveRecord::Migration
  def change
    create_table :curso_materias do |t|
      t.string :nombreGrupo
      t.string :aula
      t.string :periodo
      t.references :docente, index: true, foreign_key: true
      t.references :cat_materia, index: true, foreign_key: true
      t.string :pdfInstrumentacion
      t.string :estado
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
