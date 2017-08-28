class CreateProyInvDocumentos < ActiveRecord::Migration
  def change
    create_table :proy_inv_documentos do |t|
      t.string :descripcion
      t.string :documento
      t.references :proyecto_investigacion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
