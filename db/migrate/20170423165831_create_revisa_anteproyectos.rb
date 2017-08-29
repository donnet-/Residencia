class CreateRevisaAnteproyectos < ActiveRecord::Migration
  def change
    create_table :revisa_anteproyectos do |t|
      t.date :fecha_revicion
      t.text :observaciones_revision
      t.string :fk_curp
      t.integer :fk_id_anteproy

      t.timestamps null: false
    end
  end
end
