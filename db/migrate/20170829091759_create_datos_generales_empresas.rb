class CreateDatosGeneralesEmpresas < ActiveRecord::Migration
  def change
    create_table :datos_generales_empresas do |t|
      t.string :nombre_empresa
      t.string :calle
      t.integer :numero
      t.string :colonia
      t.integer :cp
      t.string :ciudad
      t.string :estado
      t.string :municipio
      t.string :telefono
      t.string :correo
      t.string :tipo_empresa
      t.string :tam_empresa
      t.string :actividad_economica

      t.timestamps null: false
    end
  end
end
