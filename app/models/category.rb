class Category < ApplicationRecord
    validates :name, :priority, presence: true 
    validates :name, uniqueness: true

    has_many :article_categories, dependent: :destroy
    has_many :articles, through: :article_categories

    def first_article
        arr = articles.includes(:avatar_attachment).order(created_at: :desc).first
        arr
      end
    
end
