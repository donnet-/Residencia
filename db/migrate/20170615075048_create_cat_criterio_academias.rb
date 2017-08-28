class CreateCatCriterioAcademias < ActiveRecord::Migration
  def change
    create_table :cat_criterio_academias do |t|
      t.integer :numero
      t.string :criterio
      t.string :estado

      t.timestamps null: false
    end
  end
end
