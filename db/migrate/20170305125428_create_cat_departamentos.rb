class CreateCatDepartamentos < ActiveRecord::Migration
  def change
    create_table :cat_departamentos do |t|
      t.string :nombreDpto
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
