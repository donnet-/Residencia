class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.string :dia
      t.string :hora_inicio
      t.string :hora_fin
      t.references :actualizacion_docente_profesional, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
