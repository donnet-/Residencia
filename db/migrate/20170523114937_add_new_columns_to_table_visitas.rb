class AddNewColumnsToTableVisitas < ActiveRecord::Migration
  def change
      add_column :visitas, :objetivo, :text
      add_column :visitas, :actividades, :text
  end
end
