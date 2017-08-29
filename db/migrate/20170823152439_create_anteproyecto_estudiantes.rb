class CreateAnteproyectoEstudiantes < ActiveRecord::Migration
  def change
    create_table :anteproyecto_estudiantes do |t|
      t.integer :numControl
      t.references :anteproyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
