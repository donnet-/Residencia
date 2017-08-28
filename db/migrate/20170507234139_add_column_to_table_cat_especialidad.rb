class AddColumnToTableCatEspecialidad < ActiveRecord::Migration
  def change
      add_column :cat_especialidades, :alias, :string
  end
end
