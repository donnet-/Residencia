class RanameColumnto < ActiveRecord::Migration
  def change
      rename_column :periodo_curs_materias, :ZipEstadisitica, :zipEstadisitica
  end
end
