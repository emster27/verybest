class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :state
      t.string :city
      t.string :neighborhood
      t.integer :cuisine_id
      t.integer :user_id

      t.timestamps
    end
  end
end
