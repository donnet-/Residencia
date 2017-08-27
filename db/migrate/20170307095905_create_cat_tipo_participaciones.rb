class CreateCatTipoParticipaciones < ActiveRecord::Migration
  def change
    create_table :cat_tipo_participaciones do |t|
      t.string :participacion
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
