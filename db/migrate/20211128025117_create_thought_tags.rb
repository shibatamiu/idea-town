class CreateThoughtTags < ActiveRecord::Migration[6.1]
  def change
    create_table :thought_tags do |t|
      t.references :thought, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
