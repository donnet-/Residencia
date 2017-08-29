class CreateSolicitudes < ActiveRecord::Migration
  def change
    create_table :solicitudes do |t|
      t.string :nombrep
      t.date :fechaini
      t.date :fechater
      t.string :aexterno
      t.string :telefono
      t.string :extension
      t.string :correo
      t.string :area
      t.integer :numresidentes
      t.string :carrera
      t.string :semestre
      t.string :ingles
      t.string :horaentrada
      t.string :horasalida
      t.string :desproyecto
      t.string :objetivo
      t.string :actividades
      t.string :pc
      t.string :tel_escritorio
      t.string :lugar
      t.string :beca
      t.string :observacion
      t.string :estado
      t.string :rfc

      t.timestamps null: false
    end
  end
end
