class CreateEvaluacionResidencias < ActiveRecord::Migration
  def change
    create_table :evaluacion_residencias do |t|
      t.string :id_residencia
      t.integer :num_reporte
      t.date :fecha_registro

      t.timestamps null: false
    end
  end
end
