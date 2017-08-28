class AddColumnToOficios < ActiveRecord::Migration
  def change
  	add_column :oficios, :servicio_social_id, :integer
	add_column :oficios, :fechaLibS, :date
  end
end
