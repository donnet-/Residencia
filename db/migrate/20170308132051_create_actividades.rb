class CreateActividades < ActiveRecord::Migration
  def change
    create_table :actividades do |t|
      t.string :nombreActividad
      t.string :tipoComision
      t.string :tipoEvidencia
      t.references :cat_tipo_actividad, index: true, foreign_key: true
      t.date :fechaInicio
      t.date :fechaTermino
      t.string :descripcion
      t.string :estado
      t.string :usuario_id

      t.timestamps null: false
    end
  end
end
