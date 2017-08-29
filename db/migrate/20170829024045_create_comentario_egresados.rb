class CreateComentarioEgresados < ActiveRecord::Migration
  def change
    create_table :comentario_egresados do |t|
      t.string :opinion

      t.timestamps null: false
    end
  end
end
