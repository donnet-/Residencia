class AddColumnToTableVisitas < ActiveRecord::Migration
  def change
      add_column :visitas, :estado, :string
  end
end
