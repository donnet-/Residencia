class CreateEstadisticaServicios < ActiveRecord::Migration
  def change
    create_table :estadistica_servicios do |t|
      t.string :periodo
      t.integer :promedioB
      t.integer :promedioFin
      t.string :desempeño

      t.timestamps null: false
    end
  end
end
