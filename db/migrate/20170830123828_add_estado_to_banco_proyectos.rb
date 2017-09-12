class AddEstadoToBancoProyectos < ActiveRecord::Migration
  def change
    add_column :banco_proyectos, :estado, :string
  end
end
