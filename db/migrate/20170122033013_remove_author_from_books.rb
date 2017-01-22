class RemoveAuthorFromBooks < ActiveRecord::Migration
   def up
      remove_column :books, :author
   end
   def down
      add_column :books, :author, null: false, index: true
   end
end
