class AddCatEvidenciaToActIndividualDocentes < ActiveRecord::Migration
  def change
    add_reference :act_individual_docentes, :cat_evidencia, index: true, foreign_key: true
  end
end
