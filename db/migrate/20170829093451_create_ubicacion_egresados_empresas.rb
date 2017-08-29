class CreateUbicacionEgresadosEmpresas < ActiveRecord::Migration
  def change
    create_table :ubicacion_egresados_empresas do |t|
      t.string :num_prof
      t.integer :cant_mando_superior
      t.integer :cant_mando_intermedio
      t.integer :cant_mando_tecnico
      t.string :otro_esp
      t.integer :otro_can
      t.integer :completamente
      t.integer :medianamente
      t.integer :ligeramente
      t.integer :ninguna_relacion
      t.string :requisitos
      t.string :carreras_demandan

      t.timestamps null: false
    end
  end
end
