class CreateAnteproyectoObservaciones < ActiveRecord::Migration
  def change
    create_table :anteproyecto_observaciones do |t|
      t.string :identificador
      t.text :observacion
      t.references :anteproyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
