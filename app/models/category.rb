class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, uniqueness: true

  has_many :article_categories, dependent: :destroy
  has_many :articles, -> {includes(:avatar_attachment)}, through: :article_categories, dependent: :destroy

  def first_article
    articles.includes(:avatar_attachment).order(created_at: :desc).first
  end
end
