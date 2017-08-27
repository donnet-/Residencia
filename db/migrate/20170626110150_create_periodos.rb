class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.string :periodo
      t.date :fechaInicio
      t.date :fechaTermino

      t.timestamps null: false
    end
  end
end
