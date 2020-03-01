class User < ApplicationRecord
    acts_as_token_authenticatable
    has_secure_password
    has_many :accounts
    validates_presence_of :password_digest, :username
    validates :username, uniqueness: true
end
