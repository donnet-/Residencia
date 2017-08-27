class AddColumnTuTableUsuarios < ActiveRecord::Migration
  def change
      add_column :usuarios, :curp, :string
      add_column :usuarios, :rfc, :string
      add_column :usuarios, :numControl, :integer
  end
end
