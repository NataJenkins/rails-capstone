module ArticleHelper
  def display_image(image)
    if image.avatar.attached?
      image.avatar
    else
      'default-image.jpg'
    end
  end

  def vote_unvote(article)
    @vote = Vote.find_by(user_id: current_user.id, article_id: article.id)

    if @vote
      link_to article_vote_path(article_id: article.id, id: @vote.id), class: 'card__vote', method: :delete do
        raw '<i class="fas fa-thumbs-down fa-thumbs"></i>'
      end
    else
      link_to article_votes_path(article_id: article.id), method: :post do
        raw '<i class="fas fa-thumbs-up fa-thumbs"></i>'
      end
    end
  end

  def display_vote(article)
    if user_signed_in?
      vote_unvote(article)
    else
      link_to article_votes_path(article_id: article.id), method: :post do
        raw '<i class="fas fa-thumbs-up fa-thumbs"></i>'
      end
    end
  end
end
