class CreateOficioLiberacionAcademicas < ActiveRecord::Migration
  def change
    create_table :oficio_liberacion_academicas do |t|
      t.date :fecha
      t.integer :docente_id
      t.string :periodo
      t.string :asistencia
      t.string :participacion
      t.string :asesoriaTitulacion
      t.string :propuesta
      t.string :sinodales
      t.string :partiEvento
      t.string :contribucion
      t.string :desarrollo
      t.string :propuestaBanco
      t.string :asesoriaAcad
      t.string :tutoria
      t.string :particComision
      t.text :otro
      t.string :otros
      t.string :cumplio
      t.string :jefeDpto
      t.string :presidAcad

      t.timestamps null: false
    end
  end
end
