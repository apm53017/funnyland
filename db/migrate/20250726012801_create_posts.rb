class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,         null: false
      t.string :title,            null: false
      t.text :body,               null: false
      t.string :address,          null: false, default: ""
      t.string :telephone_number, null: false
      t.string :opening_times,    null: false
      t.string :closed_day,       null: false
      t.float :latitude,          null: false, default: 0
      t.float :longitude,         null: false, default: 0
      t.integer :tag_id,
      t.timestamps
    end
  end
end
