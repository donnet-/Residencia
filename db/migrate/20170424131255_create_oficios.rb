class CreateOficios < ActiveRecord::Migration
  def change
    create_table :oficios do |t|
      t.integer :numero
      t.string :anio

      t.timestamps null: false
    end
  end
end
