class AddUserIdToThoughts < ActiveRecord::Migration[6.1]
  def change
    add_column :thoughts, :user_id, :integer
  end
end
