class CreateViajeItinerarioEmpresas < ActiveRecord::Migration
  def change
    create_table :viaje_itinerario_empresas do |t|
      t.date :fecha
      t.string :hora
      t.references :visita, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
