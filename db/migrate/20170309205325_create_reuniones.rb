class CreateReuniones < ActiveRecord::Migration
  def change
    create_table :reuniones do |t|
      t.string :numActa
      t.date :fecha
      t.string :pdfActa
      t.integer :usuario_id
      t.string :estado

      t.timestamps null: false
    end
  end
end
