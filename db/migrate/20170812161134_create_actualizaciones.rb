class CreateActualizaciones < ActiveRecord::Migration
  def change
    create_table :actualizaciones do |t|
      t.string :tipoPeriodo
      t.string :tipoActualizacion
      t.string :modalidad
      t.integer :horasCapacitacion
      t.references :actividad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
