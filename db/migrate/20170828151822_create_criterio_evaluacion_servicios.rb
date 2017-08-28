class CreateCriterioEvaluacionServicios < ActiveRecord::Migration
  def change
    create_table :criterio_evaluacion_servicios do |t|
      t.integer :id_evalucacion
      t.integer :id_cat_criterio_eva
      t.integer :calificacion_criterio

      t.timestamps null: false
    end
  end
end
