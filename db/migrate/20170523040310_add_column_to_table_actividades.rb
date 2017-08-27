class AddColumnToTableActividades < ActiveRecord::Migration
  def change
      add_column :actividades, :lugar, :string
  end
end
