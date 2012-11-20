class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :id
      t.string :title
      t.text :comment
      t.date :d_date
      t.time :d_time

      t.timestamps
    end
  end
end
