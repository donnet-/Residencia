class AddNewValuesToEvaluacionResidencia < ActiveRecord::Migration
  def change
    add_column :evaluacion_residencias, :pdf, :string
  end
end
