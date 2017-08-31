class AddAsesorExternoToBancoProyectos < ActiveRecord::Migration
  def change
    add_column :banco_proyectos, :asesor_externo, :string
  end
end
