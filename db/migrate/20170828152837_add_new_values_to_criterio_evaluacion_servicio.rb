class AddNewValuesToCriterioEvaluacionServicio < ActiveRecord::Migration
  def change
    add_column :criterio_evaluacion_servicios, :num_reporte, :integer
  end
end
