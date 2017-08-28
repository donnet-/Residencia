class RemoveEmpresaIdFromToTableServicioSociales < ActiveRecord::Migration
  def change
      remove_foreign_key :servicio_sociales, column: :empresa_id
  end
end
