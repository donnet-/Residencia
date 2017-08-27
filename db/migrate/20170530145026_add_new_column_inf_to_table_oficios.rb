class AddNewColumnInfToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :zona, :string
      add_column :oficios, :importeViat, :integer
  end
end
