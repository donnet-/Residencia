class AddHoraToReuniones < ActiveRecord::Migration
  def change
    add_column :reuniones, :hora, :string
  end
end
