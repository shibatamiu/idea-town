class AddImageToThoughts < ActiveRecord::Migration[6.1]
  def change
    add_column :thoughts, :image, :string
  end
end
