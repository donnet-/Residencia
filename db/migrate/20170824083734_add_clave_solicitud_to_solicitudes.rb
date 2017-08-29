class AddClaveSolicitudToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :clave_solicitud, :string
  end
end
