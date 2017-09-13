class ChangeSolicitudesActividades < ActiveRecord::Migration
  def up
    change_column :solicitudes, :actividades, :text 
  end

  def down
    change_column :solicitudes, :actividades, :string
  end
end
