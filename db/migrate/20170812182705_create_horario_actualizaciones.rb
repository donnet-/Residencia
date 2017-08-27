class CreateHorarioActualizaciones < ActiveRecord::Migration
  def change
    create_table :horario_actualizaciones do |t|
      t.string :dia
      t.string :hora_inicio
      t.string :hora_fin
      t.references :actualizacion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
