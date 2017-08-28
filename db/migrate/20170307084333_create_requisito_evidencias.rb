class CreateRequisitoEvidencias < ActiveRecord::Migration
  def change
    create_table :requisito_evidencias do |t|
      t.string :nombreRequisito
      t.string :estado
      t.references :cat_evidencia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
