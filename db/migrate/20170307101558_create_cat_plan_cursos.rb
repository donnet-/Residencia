class CreateCatPlanCursos < ActiveRecord::Migration
  def change
    create_table :cat_plan_cursos do |t|
      t.string :descripcion
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
