class AddNewValueToCriterioEvaluacionServicio < ActiveRecord::Migration
  def change
    add_reference :criterio_evaluacion_servicios, :evaluacion_servicio, index: true, foreign_key: true
  end
end
