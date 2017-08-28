class AddNewColumnDescripToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :descripcion, :text
  end
end
