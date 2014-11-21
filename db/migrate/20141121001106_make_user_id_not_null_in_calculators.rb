class MakeUserIdNotNullInCalculators < ActiveRecord::Migration
  def change
	change_column :calculators, :user_id, :integer, :null => false
  end
end
