class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.string :icon, null: false
      t.timestamps
    end
  end
end
