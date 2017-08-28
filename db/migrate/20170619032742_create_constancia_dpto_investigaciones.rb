class CreateConstanciaDptoInvestigaciones < ActiveRecord::Migration
  def change
    create_table :constancia_dpto_investigaciones do |t|
      t.integer :actvidad_id
      t.date :fecha

      t.timestamps null: false
    end
  end
end
