class AddColumnEncargadoToCatDepartamentos < ActiveRecord::Migration
  def change
      add_column :cat_departamentos, :encargado, :string
  end
end
