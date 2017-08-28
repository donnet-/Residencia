class CreateEgresados < ActiveRecord::Migration
  def change
    create_table :egresados do |t|
      t.integer :numControl
      t.string :opcion
      t.references :cat_plan_curso, index: true, foreign_key: true
      t.references :examen_profesional, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
