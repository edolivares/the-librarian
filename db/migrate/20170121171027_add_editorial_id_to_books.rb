class AddEditorialIdToBooks < ActiveRecord::Migration
   def up
      add_reference :books, :editorial, index: true

      Editorial.all.each do |editorial|
         Book.all.where(editorial: editorial.name).each do |book|
            book.update_column :editorial_id, editorial.id
         end
      end
   end

  # def down
  #     remove_reference(:books, :editorial, index: true)
  # end

end
