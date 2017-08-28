class AddColumnToTableCatTipoGrado < ActiveRecord::Migration
  def change
      add_column :cat_tipo_grado_estudios, :aliasEsp, :string
  end
end