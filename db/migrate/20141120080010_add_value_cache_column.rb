class AddValueCacheColumn < ActiveRecord::Migration
  def change
  	add_column :users, :value_cache, :integer, :default 0
  	add_index :users, :value_cache
  end
end
