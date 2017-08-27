class CreateCatTipoPuestos < ActiveRecord::Migration
  def change
    create_table :cat_tipo_puestos do |t|
      t.string :nombrePuesto
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
