class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :balance

      t.timestamps null: false
    end
  end
end
