class AddMoreinfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :classlevel, :string
    add_column :users, :sn, :string
  end
end
