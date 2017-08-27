class ProyectoDocenteEvidencias < ActiveRecord::Migration
  def change
    create_table :proyecto_docente_evidencias do |t|
      t.string :etiqueta
      t.string :pdfEvidencia
      t.references :proyecto_docente, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
