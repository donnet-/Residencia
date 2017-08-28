class CreateCatEvidenciaPeriodos < ActiveRecord::Migration
  def change
    create_table :cat_evidencia_periodos do |t|
      t.string :etiqueta
      t.string :tipo
      t.timestamps null: false
    end
  end
end
