class AddEstadosSecundariosToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicitudes, :estado_secundario, :string
    add_column :solicitudes, :estado_secundario_revisor, :string
  end
end
