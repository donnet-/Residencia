class CreateCatTipoExamenProyectos < ActiveRecord::Migration
  def change
    create_table :cat_tipo_examen_proyectos do |t|
      t.string :nombreTipoP
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
