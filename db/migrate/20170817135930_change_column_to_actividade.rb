class ChangeColumnToActividade < ActiveRecord::Migration
  def change
  	change_column :actividades, :descripcion, :text
  end
end
