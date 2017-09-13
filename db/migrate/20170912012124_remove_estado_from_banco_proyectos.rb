class RemoveEstadoFromBancoProyectos < ActiveRecord::Migration
  def change
    remove_column :banco_proyectos, :estado, :string
  end
end
