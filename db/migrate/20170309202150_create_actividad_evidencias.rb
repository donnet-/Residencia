class CreateActividadEvidencias < ActiveRecord::Migration
  def change
    create_table :actividad_evidencias do |t|
      t.references :cat_evidencia, index: true, foreign_key: true
      t.string :pdfEvidencia
      t.date :fechaActualizacion
      t.references :actividad, index: true, foreign_key: true
      t.string :estado
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
