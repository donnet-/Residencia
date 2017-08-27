class CreateProyInvDocentes < ActiveRecord::Migration
  def change
    create_table :proy_inv_docentes do |t|
      t.references :proyecto_investigacion, index: true, foreign_key: true
      t.integer :docente_id
      t.integer :cat_tipo_participacion_id

      t.timestamps null: false
    end
  end
end
