class AddCuisineReferenceToVenues < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :venues, :cuisines
    add_index :venues, :cuisine_id
    change_column_null :venues, :cuisine_id, false
  end
end
