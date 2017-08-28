class RemoveColumnsToTableProyectoInvestigaciones < ActiveRecord::Migration
  def change
	  remove_column :proyecto_investigaciones, :asesorInterno, :integer
	  add_column :proyecto_investigaciones, :status, :string
	  change_column :proyecto_investigaciones, :asesorExterno, :integer
  end
end
