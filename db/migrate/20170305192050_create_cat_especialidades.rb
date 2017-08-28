class CreateCatEspecialidades < ActiveRecord::Migration
  def change
    create_table :cat_especialidades do |t|
      t.string :nombreEsp
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
