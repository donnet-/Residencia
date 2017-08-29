class CreateBancoProyectos < ActiveRecord::Migration
  def change
    create_table :banco_proyectos do |t|
      t.string :fk_rfc_emp_inst
      t.string :nombre_proyecto_b
      t.text :descrip_proyecto_b
      t.string :tipo_proyecto_b
      t.date :fecha_inicio_proyecto_b
      t.date :fecha_termino_proyecto_b
      t.integer :num_residentes
      t.text :objetivo_esperado
      t.string :pdf_solicitud

      t.timestamps null: false
    end
  end
end
