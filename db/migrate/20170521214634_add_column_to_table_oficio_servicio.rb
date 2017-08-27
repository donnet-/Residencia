class AddColumnToTableOficioServicio < ActiveRecord::Migration
  def change
       add_column :oficio_servicios, :fecha, :date
  end
end
