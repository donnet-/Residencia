class RemoveHorariosToSolicitudes < ActiveRecord::Migration
  def change
    remove_column :solicitudes, :horaentrada, :string
    remove_column :solicitudes, :horasalida, :string
  end
end
