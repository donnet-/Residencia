class CreateCriterioEvaluacionResidencias < ActiveRecord::Migration
  def change
    create_table :criterio_evaluacion_residencias do |t|
      t.integer :id_evaluacion
      t.integer :id_cat_criterio_eva
      t.integer :califiacion_criterio

      t.timestamps null: false
    end
  end
end
