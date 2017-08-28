class JoinTableCatViaticoActividad < ActiveRecord::Migration
  def change
    create_join_table :cat_viaticos, :actividades do |t|
      # t.index [:cat_viatico_id, :actividad_id]
      # t.index [:actividad_id, :cat_viatico_id]
    end
  end
end
