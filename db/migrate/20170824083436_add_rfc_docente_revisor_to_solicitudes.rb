class AddRfcDocenteRevisorToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :rfc_docente_revisor, :string
  end
end
