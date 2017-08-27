class AddNewColumnToDocentes < ActiveRecord::Migration
  def change
      add_column :docentes, :contacto, :string
      add_column :docentes, :tipoCurriculum, :string
      add_column :docentes, :numCurriculum, :string
  end
end
