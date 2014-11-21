class MakeUserIdAndPostCodeUniqueIndex < ActiveRecord::Migration
  def change
  	add_index :calculators, [:post_code, :user_id], :unique => true
  end
end
