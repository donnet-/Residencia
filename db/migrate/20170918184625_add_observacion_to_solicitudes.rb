class AddObservacionToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :observacion, :string
  end
end
