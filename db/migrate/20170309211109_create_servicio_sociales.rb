class CreateServicioSociales < ActiveRecord::Migration
  def change
    create_table :servicio_sociales do |t|
      t.integer :calificacion
      t.date :fechaInicio
      t.date :fechaTermino
      t.integer :horas
      t.references :estudiante, index: true, foreign_key: true
      t.string :estado
      t.references :empresa, index: true, foreign_key: true
      t.string :pdfLiberacion
      t.string :observaciones

      t.timestamps null: false
    end
  end
end
