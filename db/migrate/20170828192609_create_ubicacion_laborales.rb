class CreateUbicacionLaborales < ActiveRecord::Migration
  def change
    create_table :ubicacion_laborales do |t|
      t.string :act_dedica
      t.string :estudia
      t.string :especialidad_institucion
      t.string :tiempo_empleo
      t.string :medio_empleo
      t.string :requisitos_contratacion
      t.string :idioma_trabajo
      t.integer :hablar_idioma
      t.integer :escribir_idioma
      t.integer :leer_idioma
      t.integer :escuchar_idioma
      t.string :anti_empleo
      t.string :ano_ingreso
      t.string :ingreso
      t.string :nivel_jerarquico
      t.string :condicion
      t.string :relacion
      t.string :organismo
      t.string :giro
      t.string :razon_social
      t.string :domicilio
      t.string :ciudad
      t.string :municipio
      t.string :estado
      t.string :telefno
      t.string :ext
      t.string :fax
      t.string :email
      t.string :pagina_web
      t.string :sector_primario
      t.string :sector_secundario
      t.string :sector_terciario
      t.string :tam_empresa

      t.timestamps null: false
    end
  end
end
