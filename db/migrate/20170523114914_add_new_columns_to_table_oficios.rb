class AddNewColumnsToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :destinatario, :string
      add_column :oficios, :jefe, :string
  end
end
