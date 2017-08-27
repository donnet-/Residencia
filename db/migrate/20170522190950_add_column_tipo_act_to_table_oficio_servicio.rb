class AddColumnTipoActToTableOficioServicio < ActiveRecord::Migration
  def change
      add_column :oficio_servicios, :tipoActividad, :string
  end
end
