class CreateTablapromedios < ActiveRecord::Migration
  def change
    create_table :tablapromedios do |t|
      t.string :nivel_desem
      t.float :valor_min
      t.float :valor_max

      t.timestamps null: false
    end
  end
end
