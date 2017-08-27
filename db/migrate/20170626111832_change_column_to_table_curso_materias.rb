class ChangeColumnToTableCursoMaterias < ActiveRecord::Migration
  def change
    remove_column :curso_materias, :periodo, :string
  	remove_foreign_key :curso_materias, column: :docente_id
  	remove_column :curso_materias, :pdfInstrumentacion, :string
  	remove_column :curso_materias, :estado, :string
  	remove_column :curso_materias, :pdfActa, :string
  	remove_column :curso_materias, :pdfCalifParcial, :string
  	remove_column :curso_materias, :muestraPortafolio, :string
  	add_column :curso_materias, :total, :integer
  end
end
