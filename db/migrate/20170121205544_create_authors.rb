class CreateAuthors < ActiveRecord::Migration
   def up
      create_table :authors do |t|
         t.string :name
      end

      Book.all.uniq.pluck(:author).each do |author|
         Author.create(name: author)
      end
   end
   def down
      drop_table :authors
   end
end
