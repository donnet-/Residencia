class CreateBancoProyectoEstudiantes < ActiveRecord::Migration
  def change
    create_table :banco_proyecto_estudiantes do |t|
      t.integer :numControl
      t.string :estado
      t.string :observacion
      t.references :banco_proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
