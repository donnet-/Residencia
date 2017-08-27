class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :curpEstudiante
      t.integer :numControl
      t.string :nombre
      t.string :apPaterno
      t.string :apMaterno
      t.string :genero
      t.string :email
      t.references :cat_especialidad, index: true, foreign_key: true
      t.integer :usuario_id
      t.string :tipo_estudiante
      t.string :estado

      t.timestamps null: false
    end
  end
end
