class CreateSolicitudHorarios < ActiveRecord::Migration
  def change
    create_table :solicitud_horarios do |t|
      t.string :dia_inicio
      t.string :dia_termino
      t.string :hora_inicio
      t.string :hora_termino
      t.references :solicitud, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
