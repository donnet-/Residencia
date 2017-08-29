class CreateAnteproyectos < ActiveRecord::Migration
  def change
    create_table :anteproyectos do |t|
      t.integer :fk_id_proyecto_b
      t.string :nombre_anteproy
      t.string :asesor_externo
      t.string :status_anteproy

      t.timestamps null: false
    end
  end
end
