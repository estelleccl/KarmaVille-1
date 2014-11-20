class AddValueCacheColumn < ActiveRecord::Migration
  def change
  	add_column :users, :value_cache, :integer
  	add_index :users, :value_cache
  end
end
