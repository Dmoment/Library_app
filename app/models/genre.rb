class Genre < ApplicationRecord
   validates :name, presence: true , uniqueness: { case_sensitive: false },length: { in: 3..25 }
 
end