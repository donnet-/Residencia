class AddNewValuesToSolicitud < ActiveRecord::Migration
  def change
    add_column :solicitudes, :cuenta_correo, :string
  end
end
