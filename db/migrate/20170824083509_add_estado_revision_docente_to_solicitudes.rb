class AddEstadoRevisionDocenteToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :estado_revision_docente, :string
  end
end
