class CreateProyectoEstudiantes < ActiveRecord::Migration
  def change
    create_table :proyecto_estudiantes do |t|
      t.integer :numControl
      t.references :proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
