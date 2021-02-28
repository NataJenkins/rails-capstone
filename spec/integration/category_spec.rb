require 'rails_helper'

RSpec.describe 'Create a new User', type: :feature do
  before do
    User.create(
      name: 'user2',
      username: 'user2'
    )
    Category.create(
      name: 'TestCat',
      priority: 3
    )
    Article.create(
      author_id: User.first.id,
      title: 'Test Article',
      content: 'Test Content'
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
    visit sign_in_path
    fill_in 'Username', with: 'user2'
    click_on 'log in'
    visit categories_path
    click_on 'New Category'
    fill_in 'Name', with: 'Test'
    click_on 'Create Category'
    visit categories_path

    expect(page).to have_content('Test')
  end

  scenario 'User not loged in' do
    visit categories_path
    click_on 'New Category'
    visit sign_in_path

    expect(page).to have_content('Username')
  end
end
