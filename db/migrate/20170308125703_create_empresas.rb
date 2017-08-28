class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :rfcEmpresa
      t.string :nombreE
      t.string :pdfConvenio
      t.string :email
      t.string :contacto
      t.string :telefono
      t.string :estado
      t.string :calle
      t.string :colonia
      t.string :numInterior
      t.string :numExterior
      t.string :estadoEmp
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
