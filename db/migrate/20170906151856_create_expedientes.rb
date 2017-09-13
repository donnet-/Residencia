class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.string :clave
      t.integer :documento_id
      t.integer :proyecto_id

      t.timestamps null: false
    end
  end
end
