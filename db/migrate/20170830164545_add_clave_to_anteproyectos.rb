class AddClaveToAnteproyectos < ActiveRecord::Migration
  def change
    add_column :anteproyectos, :clave, :string
  end
end
