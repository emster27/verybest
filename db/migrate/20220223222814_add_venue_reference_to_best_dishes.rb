class AddVenueReferenceToBestDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :best_dishes, :venues
    add_index :best_dishes, :venue_id
    change_column_null :best_dishes, :venue_id, false
  end
end
