class User < ApplicationRecord

    validates :username, presence: true, uniqueness: {message: 'Username is taken'}

    has_secure_password 

    has_many :posts 
    has_many :comments, through: :posts 
end
