class CreateCatEvidencias < ActiveRecord::Migration
  def change
    create_table :cat_evidencias do |t|
      t.string :nombreEvidencia
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
