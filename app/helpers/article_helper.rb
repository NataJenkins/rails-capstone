module ArticleHelper
  def display_image(image)
    if image.avatar.attached?
      image.avatar
    else
      'default-image.jpg'
    end
  end

end
