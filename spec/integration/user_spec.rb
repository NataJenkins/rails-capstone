require 'rails_helper'

RSpec.describe 'Create a new User', type: :feature do
  before do
    @article = User.create(
      name: 'test1',
      username: 'test1'
    )
    Category.create(
      name: 'Test Category',
      priority: 3
    )
    Article.create(
      author_id: User.first.id,
      title: 'Test Article',
      content: 'Test-content'
    )
    ArticleCategory.create(
      article_id: Article.first.id,
      category_id: Category.first.id
    )
    Vote.create(
      user_id: User.first.id,
      article_id: Article.first.id
    )
  end

  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'Name', with: 'TestUser'
    fill_in 'Username', with: 'TestUser'
    click_on 'Create User'

    visit categories_path
    expect(page).to have_content('TestUser')
  end
end
