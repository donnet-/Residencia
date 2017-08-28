class CreateViajeGrupos < ActiveRecord::Migration
  def change
    create_table :viaje_grupos do |t|
      t.references :curso_materia, index: true, foreign_key: true
      t.references :actividad, index: true, foreign_key: true
      t.string :estado
      t.string :usuario_id

      t.timestamps null: false
    end
  end
end
