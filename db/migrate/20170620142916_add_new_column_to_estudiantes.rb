class AddNewColumnToEstudiantes < ActiveRecord::Migration
  def change
      add_column :estudiantes, :contacto, :string
  end
end
