class CreateLibDocActCriterios < ActiveRecord::Migration
  def change
    create_table :lib_doc_act_criterios do |t|
      t.references :lib_actividad_docente, index: true, foreign_key: true
      t.integer :criterio_id
      t.string :valor

      t.timestamps null: false
    end
  end
end
