class RemoveColumnFromDevices < ActiveRecord::Migration[6.1]
  def change
    remove_column :devices, :email, :string
  end
end
