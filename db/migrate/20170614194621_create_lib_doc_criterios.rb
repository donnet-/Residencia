class CreateLibDocCriterios < ActiveRecord::Migration
  def change
    create_table :lib_doc_criterios do |t|
      t.references :lib_curso_docente, index: true, foreign_key: true
      t.integer :criterio_id
      t.string :respuesta

      t.timestamps null: false
    end
  end
end
