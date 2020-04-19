class Genre < ApplicationRecord
   has_many :book_genres
   has_many :books, through: :book_genres
   validates :name, presence: true , uniqueness: { case_sensitive: false },length: { in: 3..25 }
   
end