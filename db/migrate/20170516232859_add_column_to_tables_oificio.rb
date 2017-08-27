class AddColumnToTablesOificio < ActiveRecord::Migration
  def change
      add_column :oficios, :firma, :string
      add_column :oficios, :lema, :string
      add_column :oficios, :recibe, :string
  end
end
