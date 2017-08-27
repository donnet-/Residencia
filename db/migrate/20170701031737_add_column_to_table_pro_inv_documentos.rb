class AddColumnToTableProInvDocumentos < ActiveRecord::Migration
  def change
	  add_column :proy_inv_documentos, :fechaPublicacion, :date
  end
end
