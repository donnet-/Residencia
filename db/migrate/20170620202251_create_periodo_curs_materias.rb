class CreatePeriodoCursMaterias < ActiveRecord::Migration
  def change
    create_table :periodo_curs_materias do |t|
      t.string :periodo
      t.integer :docente_id
      t.string :ZipEstadisitica
      t.string :pdfInstrumentacion

      t.timestamps null: false
    end
  end
end
