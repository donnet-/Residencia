class CreateExamenProfesionales < ActiveRecord::Migration
  def change
    create_table :examen_profesionales do |t|
      t.string :hora
      t.date :fecha
      t.references :cat_tipo_examen_proyecto, index: true, foreign_key: true
      t.references :actividad, index: true, foreign_key: true
      t.string :estado

      t.timestamps null: false
    end
  end
end
