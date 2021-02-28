require 'rails_helper'

RSpec.describe 'Create a new User', type: :feature do
  before do
    User.create(
      name: 'user3',
      username: 'user3'
    )
    Category.create(
      name: 'TestCat',
      priority: 3
    )
    Article.create(
      author_id: User.first.id,
      title: 'Test Article',
      content: 'test content'
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
    fill_in 'Username', with: 'user3'
    click_on 'log in'
    visit categories_path
    click_on 'New Article'
    fill_in 'Title', with: 'New title'
    fill_in 'Content', with: 'Test article'
    click_on 'Create Article'

    expect(page).to have_content('New title')
  end

  scenario 'content cant be blank' do
    visit sign_in_path
    fill_in 'Username', with: 'user3'
    click_on 'log in'
    visit categories_path
    click_on 'New Article'
    fill_in 'Title', with: 'New title'
    fill_in 'Content', with: ''
    click_on 'Create Article'

    expect(page).to have_content('Article')
  end

  scenario 'title cant be blank' do
    visit sign_in_path
    fill_in 'Username', with: 'user3'
    click_on 'log in'
    visit categories_path
    click_on 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Content', with: 'article content'
    click_on 'Create Article'

    expect(page).to have_content('Article')
  end

  scenario 'User not loged in' do
    visit categories_path
    click_on 'New Article'
    visit sign_in_path

    expect(page).to have_content('Username')
  end
end
