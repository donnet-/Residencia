class CreateLibActividadDocentes < ActiveRecord::Migration
  def change
    create_table :lib_actividad_docentes do |t|
      t.references :periodo_actividad_academica, index: true, foreign_key: true
      t.integer :docente_id
      t.date :fecha

      t.timestamps null: false
    end
  end
end
