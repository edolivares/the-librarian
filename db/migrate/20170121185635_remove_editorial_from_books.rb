class RemoveEditorialFromBooks < ActiveRecord::Migration
   def up
      remove_column :books, :editorial
   end
   def down
      add_column :books, :editorial, null: false, index: true
   end
end
