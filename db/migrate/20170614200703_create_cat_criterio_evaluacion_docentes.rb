class CreateCatCriterioEvaluacionDocentes < ActiveRecord::Migration
  def change
    create_table :cat_criterio_evaluacion_docentes do |t|
      t.integer :numero
      t.string :criterio
      t.string :estado

      t.timestamps null: false
    end
  end
end
