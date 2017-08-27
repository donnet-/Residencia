class CreateEstadisticas < ActiveRecord::Migration
  def change
    create_table :estadisticas do |t|
      t.string :carrera
      t.integer :ordinaria
      t.integer :complementaria
      t.integer :especial
      t.integer :desertores
      t.integer :reprobados
      t.references :curso_materia, index: true, foreign_key: true
      t.references :periodo_curs_materia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
