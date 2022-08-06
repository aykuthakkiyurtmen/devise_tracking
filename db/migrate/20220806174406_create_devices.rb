class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :device_identity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :devices, :device_identity, unique: true
  end
end
