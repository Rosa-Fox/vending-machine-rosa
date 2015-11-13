class AddBalanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance => 50, :integer
  end
end
