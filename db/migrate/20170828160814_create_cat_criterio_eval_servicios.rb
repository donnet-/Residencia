class CreateCatCriterioEvalServicios < ActiveRecord::Migration
  def change
    create_table :cat_criterio_eval_servicios do |t|
      t.string :nombre_criterio
      t.integer :cal_A
      t.string :status

      t.timestamps null: false
    end
  end
end
