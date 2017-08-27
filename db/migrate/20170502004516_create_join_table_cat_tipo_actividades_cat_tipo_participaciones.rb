class CreateJoinTableCatTipoActividadesCatTipoParticipaciones < ActiveRecord::Migration
  def change
    create_join_table :cat_tipo_actividades, :cat_tipo_participaciones do |t|
      # t.index [:cat_tipo_actividad_id, :cat_tipo_participacion_id]
      # t.index [:cat_tipo_participacion_id, :cat_tipo_actividad_id]
    end
  end
end
