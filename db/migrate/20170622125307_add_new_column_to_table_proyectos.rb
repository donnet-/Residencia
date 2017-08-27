class AddNewColumnToTableProyectos < ActiveRecord::Migration
  def change
      add_column :proyectos, :fechaInicio, :date
      add_column :proyectos, :fechaTermino, :date
      add_column :proyectos, :descripcion, :text
      add_column :proyectos, :periodo, :string
      add_column :proyectos, :rfcEmpresa, :string
  end
end
