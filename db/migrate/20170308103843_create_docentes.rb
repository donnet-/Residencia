class CreateDocentes < ActiveRecord::Migration
  def change
    create_table :docentes do |t|
      t.string :curp
      t.string :rfc
      t.string :clavePresupuestal
      t.string :nombreD
      t.string :apPaterno
      t.string :apMaterno
      t.string :genero
      t.string :email
      t.references :cat_departamento, index: true, foreign_key: true
      t.string :tipoDocente
      t.references :usuario, index: true, foreign_key: true
      t.string :estado

      t.timestamps null: false
    end
  end
end
