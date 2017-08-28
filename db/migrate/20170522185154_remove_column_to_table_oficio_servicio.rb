class RemoveColumnToTableOficioServicio < ActiveRecord::Migration
  def change
      remove_column :oficio_servicios, :rev ,:string
  end
end
