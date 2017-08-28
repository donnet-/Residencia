class AddNewColumnToActividades < ActiveRecord::Migration
  def change
	  add_column :actividades, :hora, :string
	  add_column :actividades, :tipoexamen, :string
  end
end
