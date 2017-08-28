class AddColumnOficios < ActiveRecord::Migration
  def change
      add_reference :oficios, :actividad_docente, index: true, foreign_key: true
      add_reference :oficios, :actividad, index: true, foreign_key: true
  end
end
