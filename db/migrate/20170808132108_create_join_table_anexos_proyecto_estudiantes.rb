class CreateJoinTableAnexosProyectoEstudiantes < ActiveRecord::Migration
  def change
    create_join_table :proyecto_estudiantes, :anexos do |t|
      # t.index [:proyecto_estudiante_id, :anexo_id]
      # t.index [:anexo_id, :proyecto_estudiante_id]
    end
  end
end
