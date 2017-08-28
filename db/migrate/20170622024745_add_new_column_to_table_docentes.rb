class AddNewColumnToTableDocentes < ActiveRecord::Migration
  def change
      add_column :docentes, :sni, :string 
      add_column :docentes, :sniEvidencia, :string
      add_column :docentes, :prodep, :string
      add_column :docentes, :prodepEvidencia, :string
  end
end
