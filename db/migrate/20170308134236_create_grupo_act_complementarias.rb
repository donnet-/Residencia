class CreateGrupoActComplementarias < ActiveRecord::Migration
  def change
    create_table :grupo_act_complementarias do |t|
      t.references :actividad_complementaria, index: true, foreign_key: true
      t.integer :numControl
      t.string :estado
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
