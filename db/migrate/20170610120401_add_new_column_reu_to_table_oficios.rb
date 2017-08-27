class AddNewColumnReuToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :jefeDivision, :string
      add_column :oficios, :reunion_id, :integer
      add_column :oficios, :proyecto_id, :integer
      add_column :oficios, :numControl, :integer
  end
end
