class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :tel, :string
    add_column :users, :address, :string
    add_column :users, :reason, :text
    add_column :users, :question, :text
    add_column :users, :admin, :boolean, :default => :false
  end
end
