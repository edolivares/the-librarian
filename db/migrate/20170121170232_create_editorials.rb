class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :name

    end

      Book.all.uniq.pluck(:editorial).each do |editorial|
         Editorial.create(name: editorial)
      end
  end
end
