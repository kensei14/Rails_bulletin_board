class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.binary :profile_img

      t.timestamps
    end
  end
end
