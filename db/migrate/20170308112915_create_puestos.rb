class CreatePuestos < ActiveRecord::Migration
  def change
    create_table :puestos do |t|
      t.date :fechaInicio
      t.date :fechaTermino
      t.string :pdfNombramiento
      t.references :cat_tipo_puesto, index: true, foreign_key: true
      t.references :docente, index: true, foreign_key: true
      t.string :estado
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
