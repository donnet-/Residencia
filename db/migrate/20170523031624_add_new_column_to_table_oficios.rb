class AddNewColumnToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :tipoZona, :string
      add_column :oficios, :tipoAnDe, :string
  end
end
