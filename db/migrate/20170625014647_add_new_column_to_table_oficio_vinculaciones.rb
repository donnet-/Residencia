class AddNewColumnToTableOficioVinculaciones < ActiveRecord::Migration
  def change
      add_column :oficio_vinculaciones, :fechaLiberacion, :date
  end
end
