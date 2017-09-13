class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :cat_documentos_id
      t.string :pdf_documento
      t.references :proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
