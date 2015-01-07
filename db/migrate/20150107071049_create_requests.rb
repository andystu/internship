class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :intern_id
      t.integer :user_id
      t.datetime :request_date
      t.boolean :mark

      t.timestamps
    end
  end
end
