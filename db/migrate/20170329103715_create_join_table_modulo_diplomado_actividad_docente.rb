class CreateJoinTableModuloDiplomadoActividadDocente < ActiveRecord::Migration
  def change
    create_join_table  :actividad_docentes, :modulo_diplomados do |t|
      # t.index [:actividad_docente_id, :modulo_diplomado_id]
      # t.index [:modulo_diplomado_id, :actividad_docente_id]
    end
  end
end
