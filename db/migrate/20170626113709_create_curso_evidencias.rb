class CreateCursoEvidencias < ActiveRecord::Migration
  def change
    create_table :curso_evidencias do |t|
      t.string :etiqueta
      t.string :archivo
      t.references :curso_materia, index: true, foreign_key: true
      t.references :periodo_curs_materia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
