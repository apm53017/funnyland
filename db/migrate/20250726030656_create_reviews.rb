class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :review,  null: false
      t.string :comment
      t.timestamps
    end
  end
end
