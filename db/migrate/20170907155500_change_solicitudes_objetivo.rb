class ChangeSolicitudesObjetivo < ActiveRecord::Migration
  def up
    change_column :solicitudes, :objetivo, :text 
  end

  def down
    change_column :solicitudes, :desproyecto, :string
  end
end
