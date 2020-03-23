class Library < ApplicationRecord
    validates :name, presence: true,length: { in: 3..50 }
end
