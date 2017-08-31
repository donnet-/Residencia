class CreateCatCriterioEvalResidencias < ActiveRecord::Migration
  def change
    create_table :cat_criterio_eval_residencias do |t|
      t.string :criterio_eval
      t.integer :valor
      t.string :status

      t.timestamps null: false
    end
  end
end
