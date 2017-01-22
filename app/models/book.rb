# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  author           :string(255)      not null
#  editorial        :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Book < ActiveRecord::Base
   # Las dejé comentadas por relación inexistente al crear la migración.
   # Se asume que la tabla Book es la primera, siendo editorial y autor siguientes a esta.
   # No dejarlas comentadas durante la migración inicial daría un AssociationTypeMismatch
  
   belongs_to :editorial
   has_many :registros
   has_many :authors, through: :registros
   has_attached_file :cover_photo, styles: { medium: "210x180>", thumb: "50x45>" }, default_url: "/images/:style/conver_photo.png"
   validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

  validates :title, :author, :editorial, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  
  
end
