class AddColumnCabeceraToTablePeriodoLiberacionCursos < ActiveRecord::Migration
  def change
	  add_column :periodo_liberacion_cursos, :cabeceraPeriodo, :string
  end
end
