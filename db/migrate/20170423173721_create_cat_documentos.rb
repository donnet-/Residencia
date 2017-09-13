class CreateCatDocumentos < ActiveRecord::Migration
  def change
    create_table :cat_documentos do |t|
      t.string :nom_documento
      t.string :estado
      t.string :etapa # Etapa del proyecto de residencia en la que se requiere subir el doc

      t.timestamps null: false
    end
  end
end
