class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  has_one_attached :avatar
  has_many :votes, dependent: :destroy

  scope :get_most_votes, -> { joins(:votes).group('articles.id').order('count(votes.id) desc').first }
end
