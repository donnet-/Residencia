class RemoveEstadoFromToTableActividades < ActiveRecord::Migration
  def change
      remove_column :actividades, :estado, :string
  end
end
