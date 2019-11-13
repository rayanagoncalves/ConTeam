class AddImageToContainer < ActiveRecord::Migration[6.0]
  def change
    add_column :containers, :image, :string
  end
end
