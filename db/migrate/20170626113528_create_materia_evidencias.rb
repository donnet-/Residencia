class CreateMateriaEvidencias < ActiveRecord::Migration
  def change
    create_table :materia_evidencias do |t|
      t.string :etiqueta
      t.string :archivo
      t.references :periodo_curs_materia, index: true, foreign_key: true
      t.references :cat_materia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
