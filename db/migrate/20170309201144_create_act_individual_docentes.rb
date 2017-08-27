class CreateActIndividualDocentes < ActiveRecord::Migration
  def change
    create_table :act_individual_docentes do |t|
      t.string :pdfEvidencia
      t.references :actividad_docente, index: true, foreign_key: true
      t.string :estado
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
