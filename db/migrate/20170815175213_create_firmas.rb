class CreateFirmas < ActiveRecord::Migration
  def change
    create_table :firmas do |t|
      t.string :cargo
      t.string :titular

      t.timestamps null: false
    end
  end
end
