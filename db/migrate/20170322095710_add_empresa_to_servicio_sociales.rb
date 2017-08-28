class AddEmpresaToServicioSociales < ActiveRecord::Migration
  def change
    add_column :servicio_sociales, :nombreE, :string
  end
end
