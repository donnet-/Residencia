class CreateGradoEstudios < ActiveRecord::Migration
  def change
    create_table :grado_estudios do |t|
      t.string :nombreGrado
      t.references :cat_tipo_grado_estudio, index: true, foreign_key: true
      t.string :institucion
      t.string :pdfEvidencia
      t.references :docente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
