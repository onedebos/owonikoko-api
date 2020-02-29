class User < ApplicationRecord
    has_secure_password
    has_many :accounts
    validates_presence_of :password_digest, :username
    validates :username, uniqueness: true
end
