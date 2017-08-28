class RemoveDerechosCedidosFromToAnexos < ActiveRecord::Migration
  def change
      remove_column :anexos, :derechosCedidos, :boolean
  end
end
