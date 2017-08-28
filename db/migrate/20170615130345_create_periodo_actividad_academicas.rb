class CreatePeriodoActividadAcademicas < ActiveRecord::Migration
  def change
    create_table :periodo_actividad_academicas do |t|
      t.string :periodo

      t.timestamps null: false
    end
  end
end
