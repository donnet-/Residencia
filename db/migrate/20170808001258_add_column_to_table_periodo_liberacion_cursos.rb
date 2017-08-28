class AddColumnToTablePeriodoLiberacionCursos < ActiveRecord::Migration
  def change
	  add_column :periodo_liberacion_cursos, :notaAbajo, :text
  end
end
