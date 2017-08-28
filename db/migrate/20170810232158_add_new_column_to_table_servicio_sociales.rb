class AddNewColumnToTableServicioSociales < ActiveRecord::Migration
  def change
  	 add_column :servicio_sociales, :pdfPresentacion, :string
	 add_column :servicio_sociales, :pdfAceptacion, :string
  end
end
