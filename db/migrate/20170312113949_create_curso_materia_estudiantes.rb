class CreateCursoMateriaEstudiantes < ActiveRecord::Migration
  def change
    create_table :curso_materia_estudiantes do |t|
      t.references :curso_materia, index: true, foreign_key: true
      t.integer :numControl
      t.string :nombre
      t.string :apellidoPaterno
      t.string :apellidoMaterno

      t.timestamps null: false
    end
  end
end
