class CreateBestDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :best_dishes do |t|
      t.integer :user_id
      t.integer :venue_id
      t.integer :bookmark_count

      t.timestamps
    end
  end
end
