class AddNewColumnToCursoMaterias < ActiveRecord::Migration
  def change
    add_reference :curso_materias, :periodo_curs_materia, index: true, foreign_key: true
    add_column :curso_materias, :pdfActa, :string
    add_column :curso_materias, :pdfCalifParcial, :string
    add_column :curso_materias, :muestraPortafolio, :string
  end
end
