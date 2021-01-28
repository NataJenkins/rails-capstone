class Category < ApplicationRecord
    validates :name, :priority, presence: true 
    validates :name, uniqueness: true
end
