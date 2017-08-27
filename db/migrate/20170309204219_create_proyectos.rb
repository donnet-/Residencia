class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :numProyecto
      t.string :nombreProyecto
      t.string :status
      t.string :asesorExterno
      t.references :actividad, index: true, foreign_key: true
      t.references :cat_tipo_examen_proyecto, index: true, foreign_key: true
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
