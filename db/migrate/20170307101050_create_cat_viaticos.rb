class CreateCatViaticos < ActiveRecord::Migration
  def change
    create_table :cat_viaticos do |t|
      t.string :nombreViatico
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
