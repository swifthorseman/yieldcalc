class AddUserIdToCalculators < ActiveRecord::Migration
  def change
    add_column :calculators, :user_id, :integer
    add_index  :calculators, :user_id  	
  end
end
