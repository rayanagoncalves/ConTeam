class CreateContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :containers do |t|
      t.string :name
      t.string :container_name

      t.timestamps
    end
  end
end
