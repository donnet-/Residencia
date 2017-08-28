class CreateProyectoInvestigaciones < ActiveRecord::Migration
  def change
    create_table :proyecto_investigaciones do |t|
      t.string :numProyecto
      t.string :nombreProy
      t.string :asesorInterno
      t.string :cat_tipo_examen_proyecto_id

      t.timestamps null: false
    end
  end
end
