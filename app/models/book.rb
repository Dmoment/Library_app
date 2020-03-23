class Book < ApplicationRecord
    validates :name, presence: true,length: { in: 3..50 }
    validates :author, presence: true,length: { in: 2..50 }
    validates :price, presence: true,length: { in: 1..5000 }
end
