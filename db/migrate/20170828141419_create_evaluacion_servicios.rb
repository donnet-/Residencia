class CreateEvaluacionServicios < ActiveRecord::Migration
  def change
    create_table :evaluacion_servicios do |t|
      t.integer :id_servicio_social
      t.integer :num_reporte
      t.string :pdf_eval_servicio
      t.date :fecha_registro_servicio

      t.timestamps null: false
    end
  end
end
