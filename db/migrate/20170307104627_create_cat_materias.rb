class CreateCatMaterias < ActiveRecord::Migration
  def change
    create_table :cat_materias do |t|
      t.string :claveMateria
      t.string :nombreMat
      t.string :credito
      t.string :temario
      t.string :estado
      t.references :cat_plan_curso, index: true, foreign_key: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
