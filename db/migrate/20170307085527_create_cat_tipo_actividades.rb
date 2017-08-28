class CreateCatTipoActividades < ActiveRecord::Migration
  def change
    create_table :cat_tipo_actividades do |t|
      t.string :nombreTipoAct
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
