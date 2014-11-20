class CreateCalculators < ActiveRecord::Migration
  def change
    create_table :calculators do |t|
      t.string  :email,          limit: 255, null: false
      t.string  :telephone,      limit: 20,  null: false
      t.string  :post_code,      limit: 10,  null: false
      t.decimal :current_rent,               null: false
      t.decimal :initial_cost,               null: false

      t.timestamps
    end
  end
end
