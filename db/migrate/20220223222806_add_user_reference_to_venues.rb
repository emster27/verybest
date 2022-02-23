class AddUserReferenceToVenues < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :venues, :users
    add_index :venues, :user_id
    change_column_null :venues, :user_id, false
  end
end
