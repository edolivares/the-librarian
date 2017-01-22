class CreateRegistros < ActiveRecord::Migration
   def up
      create_table :registros, id: false do |t|
         t.integer :book_id
         t.integer :author_id
      end

      add_index :registros, :book_id
      add_index :registros, :author_id

      Author.all.each do |author|
         Book.all.where(author: author.name).each do |book|
            Registro.create(author_id: author.id, book_id: book.id)
         end
      end
   end
   def down
      drop_table :registros
   end
end
