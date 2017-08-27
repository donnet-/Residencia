class ChangeToColumnToTableOficio < ActiveRecord::Migration
  def change
      change_column :oficios, :cuota, :integer
      remove_column :oficios, :importe, :string
  end
end
