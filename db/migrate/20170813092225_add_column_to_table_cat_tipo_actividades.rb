class AddColumnToTableCatTipoActividades < ActiveRecord::Migration
  def change
	  add_column :cat_tipo_actividades, :textoSugerido, :text
	  add_column :cat_tipo_actividades, :cabecera, :string
	  add_column :cat_tipo_actividades, :requiereOficio, :string
  end
end