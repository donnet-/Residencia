class AddColumnToPeriodoCursaterias < ActiveRecord::Migration
  def change
    add_column :periodo_curs_materias, :estadistica, :boolean, default: false
  end
end
