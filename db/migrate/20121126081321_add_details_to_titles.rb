class AddDetailsToTitles < ActiveRecord::Migration
  def up
    add_column :boards, :user_id, :integer
  end
end
