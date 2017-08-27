class AddColumnLiquidacionToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :categoria, :string
      add_column :oficios, :sueldo, :integer
  end
end
