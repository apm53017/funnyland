class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :post, null: false
      t.references :user, null: false
      t.integer :review,  null: false, default: 0
      t.string :comment
      t.timestamps
    end
  end
end
