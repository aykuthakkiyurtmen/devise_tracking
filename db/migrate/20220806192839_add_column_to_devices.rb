class AddColumnToDevices < ActiveRecord::Migration[6.1]
  def change
    add_column :devices, :is_active, :boolean
  end
end
