class DropCatViaticoActividad < ActiveRecord::Migration
  def change
      drop_table :actividades_cat_viaticos
  end
end
