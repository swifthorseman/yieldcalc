class RemoveEmailTelephoneFromCalculators < ActiveRecord::Migration
  def change
    remove_column :calculators, :email
    remove_column :calculators, :telephone
  end
end
