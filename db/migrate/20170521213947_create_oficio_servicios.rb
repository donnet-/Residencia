class CreateOficioServicios < ActiveRecord::Migration
  def change
    create_table :oficio_servicios do |t|
      t.integer :numOficio
      t.string :anio
      t.integer :rev
      t.references :servicio_social, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
