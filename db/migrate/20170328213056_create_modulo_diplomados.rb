class CreateModuloDiplomados < ActiveRecord::Migration
  def change
    create_table :modulo_diplomados do |t|
      t.string :nombreModulo
      t.date :fechaInicio
      t.date :fechaTermino
      t.string :duracion
      t.references :actividad_docente, index: true, foreign_key: true
      t.references :actividad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
