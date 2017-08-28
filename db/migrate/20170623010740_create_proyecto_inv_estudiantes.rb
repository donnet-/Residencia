class CreateProyectoInvEstudiantes < ActiveRecord::Migration
  def change
    create_table :proyecto_inv_estudiantes do |t|
      t.references :proyecto_investigacion, index: true, foreign_key: true
      t.integer :numControl

      t.timestamps null: false
    end
  end
end
