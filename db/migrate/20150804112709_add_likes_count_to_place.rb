class AddLikesCountToPlace < ActiveRecord::Migration
  def change
    add_column :places, :likes_count, :integer, default: 0
  end
end
