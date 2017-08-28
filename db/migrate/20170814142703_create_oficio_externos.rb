class CreateOficioExternos < ActiveRecord::Migration
  def change
    create_table :oficio_externos do |t|
      t.string :etiqueta
      t.string :pdf_oficio
      t.references :oficio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
