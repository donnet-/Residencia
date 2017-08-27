class CreateVisitas < ActiveRecord::Migration
  def change
    create_table :visitas do |t|
      t.string :asunto
      t.references :actividad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
