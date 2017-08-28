class CreateArchivoProdepDocentes < ActiveRecord::Migration
  def change
    create_table :archivo_prodep_docentes do |t|
      t.string :tipoArchivo
      t.string :etiqueta
      t.string :archivoPdf
      t.references :docente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
