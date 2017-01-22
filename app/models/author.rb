class Author < ActiveRecord::Base
   has_many :registros
   has_many :books, through: :registros
end
