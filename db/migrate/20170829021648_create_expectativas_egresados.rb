class CreateExpectativasEgresados < ActiveRecord::Migration
  def change
    create_table :expectativas_egresados do |t|
      t.string :cursos_actualizacion
      t.string :tomar_posgrado
      t.string :describir

      t.timestamps null: false
    end
  end
end
