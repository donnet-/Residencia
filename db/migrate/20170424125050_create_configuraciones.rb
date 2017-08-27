class CreateConfiguraciones < ActiveRecord::Migration
  def change
    create_table :configuraciones do |t|
      t.string :tipo
      t.string :contenido
      t.string :imagen

      t.timestamps null: false
    end
  end
end
