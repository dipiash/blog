require "rails_helper"

describe PostsController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post, title: "TEST01", user_id: user.id) }

  before do
    visit '/login'
    expect(page).to have_title('Dipiash | Вход')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Войти'
    expect(page).to have_title('Dipiash | Новости')
  end

  it 'Feed' do
    visit root_path
    page.status_code == '200'
    expect(page).to have_title('Dipiash | Новости')
  end

  it 'FAQ' do
    visit faq_path
    page.status_code == '200'
    expect(page).to have_title('Dipiash | FAQ')
  end

  it 'Cloud tags' do
    visit cloud_tags_path
    page.status_code == '200'
    expect(page).to have_title('Dipiash | Облако тэгов')
  end

  it 'Admin panel - list posts' do
    visit posts_path
    page.status_code == '200'
    expect(page).to have_title('Dipiash | Список записей')
  end

  it 'Testing tile post' do
    visit "posts/#{post.id}"
    page.status_code == '200'
    expect(page).to have_title('Dipiash | TEST01')
  end

  it 'Admin panel - new post' do
    visit new_post_path
    page.status_code == '200'
    expect(page).to have_title('Dipiash | Новая запись')
  end

  it 'Admin panel - edit post' do
    visit "posts/#{post.id}/edit"
    page.status_code == '200'
    expect(page).to have_title('Dipiash | Редактировать запись')
  end

  it 'Error 404' do
    visit '/404'
    page.status_code == '404'
  end

  it 'Error 500' do
    visit '/500'
    page.status_code == '500'
  end
end
