class CreateLiberacionCursos < ActiveRecord::Migration
  def change
    create_table :liberacion_cursos do |t|
      t.string :periodo

      t.timestamps null: false
    end
  end
end
