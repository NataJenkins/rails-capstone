module CategoriesHelper
  def cat_drop
    Category.all
  end

  def truncated_text(content)
    truncated_text = content.split(' ')[0..30].join(' ')
    "#{truncated_text}..."
  end
end
