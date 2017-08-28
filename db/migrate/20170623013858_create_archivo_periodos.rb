class CreateArchivoPeriodos < ActiveRecord::Migration
  def change
    create_table :archivo_periodos do |t|
      t.string :descripcion
      t.string :archivo
      t.references :periodo_curs_materia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
