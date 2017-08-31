class AddClaveToBancoProyectos < ActiveRecord::Migration
  def change
    add_column :banco_proyectos, :clave, :string
  end
end
