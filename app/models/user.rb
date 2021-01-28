class User < ApplicationRecord
    validates :name, :username, presence: true
    validates :username, uniqueness: true
end
