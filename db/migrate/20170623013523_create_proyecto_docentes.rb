class CreateProyectoDocentes < ActiveRecord::Migration
  def change
    create_table :proyecto_docentes do |t|
      t.references :proyecto, index: true, foreign_key: true
      t.integer :docente_id
      t.string :cat_tipo_participacion_id

      t.timestamps null: false
    end
  end
end
