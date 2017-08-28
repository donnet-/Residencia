class CreateJoinTableCatTipoActividadesCatEvidencias < ActiveRecord::Migration
  def change
    create_join_table :cat_tipo_actividades, :cat_evidencias do |t|
      # t.index [:cat_tipo_actividad_id, :cat_evidencia_id]
      # t.index [:cat_evidencia_id, :cat_tipo_actividad_id]
    end
  end
end
