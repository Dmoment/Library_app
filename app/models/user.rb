class User < ApplicationRecord
    has_many :books, dependent: :destroy
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false },length: { in: 3..25 }
     
    validates :email, presence: true, uniqueness: { case_sensitive: false },length: { in: 6..150 },
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Not proper email"}
    has_secure_password

end