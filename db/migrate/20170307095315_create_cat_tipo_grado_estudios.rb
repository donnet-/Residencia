class CreateCatTipoGradoEstudios < ActiveRecord::Migration
  def change
    create_table :cat_tipo_grado_estudios do |t|
      t.string :nombreTipoGrado
      t.string :estado
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
