class CreatePeriodoLiberacionCursos < ActiveRecord::Migration
  def change
    create_table :periodo_liberacion_cursos do |t|
      t.string :periodo

      t.timestamps null: false
    end
  end
end
