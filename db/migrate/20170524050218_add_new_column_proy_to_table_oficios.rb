class AddNewColumnProyToTableOficios < ActiveRecord::Migration
  def change
      add_column :oficio_reuniones, :proyecto, :integer
  end
end
