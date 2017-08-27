class AddColumnToActividades < ActiveRecord::Migration
  def change
	  add_column :actividades, :proyecto_id, :integer
  end
end
