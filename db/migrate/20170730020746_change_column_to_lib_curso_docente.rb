class ChangeColumnToLibCursoDocente < ActiveRecord::Migration
  def change
  	change_column :lib_curso_docentes, :fecha, :date
  end
end
