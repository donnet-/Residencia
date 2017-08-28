class AddNewColumnToTableOficioReunionAcademica < ActiveRecord::Migration
  def change
      add_column :oficio_liberacion_academicas, :reunion_id, :integer
  end
end
