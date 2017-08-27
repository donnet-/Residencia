class AddColumnPasajeToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficios, :pPartida, :string
      add_column :oficios, :pLlegada, :string
      add_column :oficios, :claseServ, :string
      add_column :oficios, :importe, :integer
  end
end
