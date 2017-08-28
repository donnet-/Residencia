class RemoveActividadDocenteToTableModuloDiplomados < ActiveRecord::Migration
  def change
      remove_foreign_key :modulo_diplomados, column: :actividad_docente_id
  end
end
