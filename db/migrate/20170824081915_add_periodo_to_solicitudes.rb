class AddPeriodoToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :periodo, :string
  end
end
