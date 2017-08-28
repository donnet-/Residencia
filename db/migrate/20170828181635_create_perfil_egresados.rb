class CreatePerfilEgresados < ActiveRecord::Migration
  def change
    create_table :perfil_egresados do |t|
      t.string :nombre
      t.integer :fk_numControl
      t.date :fecha_nac
      t.string :curp
      t.string :sexo
      t.string :edo_civil
      t.string :direccion
      t.integer :telefon
      t.string :email
      t.string :egresado_especialidad
      t.string :fecha_egresado
      t.string :titulo
      t.integer :dominio_ingles
      t.integer :idioma_otro
      t.string :m_software

      t.timestamps null: false
    end
  end
end
