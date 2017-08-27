class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.string :pdfAnexo
      t.date :fechaAnexo
      t.boolean :derechosCedidos
      t.references :proyecto, index: true, foreign_key: true
      t.references :reunion, index: true, foreign_key: true
      t.string :estado

      t.timestamps null: false
    end
  end
end
