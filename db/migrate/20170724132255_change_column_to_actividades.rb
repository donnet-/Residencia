class ChangeColumnToActividades < ActiveRecord::Migration
  def change
	  change_column :actividades, :proyecto_id, :string
  end
end
