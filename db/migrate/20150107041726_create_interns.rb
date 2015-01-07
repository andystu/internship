class CreateInterns < ActiveRecord::Migration
  def change
    create_table :interns do |t|
      t.string :title
      t.date :starttime
      t.date :endtime
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
