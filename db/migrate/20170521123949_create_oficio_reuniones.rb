class CreateOficioReuniones < ActiveRecord::Migration
  def change
    create_table :oficio_reuniones do |t|
      t.integer :numOficio
      t.string :anio
      t.date :fechaG
      t.string :destinatario
      t.string :jefeDivision
      t.references :reunion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
