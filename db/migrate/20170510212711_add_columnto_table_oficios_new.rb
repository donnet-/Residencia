class AddColumntoTableOficiosNew < ActiveRecord::Migration
  def change
      add_column :oficios, :fecha, :date
      add_column :oficios, :participacion, :string
  end
end
