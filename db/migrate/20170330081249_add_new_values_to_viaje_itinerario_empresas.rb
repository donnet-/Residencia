class AddNewValuesToViajeItinerarioEmpresas < ActiveRecord::Migration
  def change
    add_column :viaje_itinerario_empresas, :curpEmpresa, :string
  end
end
