class User < ApplicationRecord
    validates :name, :username, presence: true
    validates :username, uniqueness: true
    has_many :articles, foreign_key: :author_id
    has_many :votes
end
