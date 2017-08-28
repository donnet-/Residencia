class CreateActividadDocentes < ActiveRecord::Migration
  def change
    create_table :actividad_docentes do |t|
      t.references :docente, index: true, foreign_key: true
      t.references :cat_tipo_participacion, index: true, foreign_key: true
      t.references :actividad, index: true, foreign_key: true
      t.integer :usuario_id
      t.string :estado

      t.timestamps null: false
    end
  end
end
