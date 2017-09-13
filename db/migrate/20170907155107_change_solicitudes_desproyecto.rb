class ChangeSolicitudesDesproyecto < ActiveRecord::Migration
  def up
    change_column :solicitudes, :desproyecto, :text 
  end

  def down
    change_column :solicitudes, :desproyecto, :string
  end
end
