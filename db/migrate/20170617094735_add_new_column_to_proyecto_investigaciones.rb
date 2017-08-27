class AddNewColumnToProyectoInvestigaciones < ActiveRecord::Migration
  def change
      add_column :proyecto_investigaciones, :asesorExterno, :string
      add_column :proyecto_investigaciones, :fechaInicio, :date
      add_column :proyecto_investigaciones, :fechaTermino, :date
      change_column :proyecto_investigaciones, :asesorInterno, :integer
  end
end
