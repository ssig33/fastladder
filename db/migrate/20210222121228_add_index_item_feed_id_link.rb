class AddIndexItemFeedIdLink < ActiveRecord::Migration
  def change
    add_index :items, [:feed_id, :link]
  end
end
