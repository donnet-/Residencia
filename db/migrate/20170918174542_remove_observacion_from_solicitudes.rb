class RemoveObservacionFromSolicitudes < ActiveRecord::Migration
  def change
    remove_column :solicitudes, :observacion, :string
  end
end
