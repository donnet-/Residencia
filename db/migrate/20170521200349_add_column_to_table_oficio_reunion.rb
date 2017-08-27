class AddColumnToTableOficioReunion < ActiveRecord::Migration
  def change
      add_column :oficio_reuniones, :numControl, :integer
  end
end
