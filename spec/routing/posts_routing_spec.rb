require "rails_helper"

describe PostsController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post, title: "TEST01") }

  before do
    visit '/login'
    expect(page).to have_title('Dipiash | Вход')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Войти'
  end

  it "should be login is true" do
    expect(page).to have_title('Dipiash | Новости')
    visit '/posts'
    expect(page).to have_title('Dipiash | Список записей')
  end

  it "should validt title for post" do
    visit "posts/#{post.id}"
    expect(page).to have_title('Dipiash | TEST01')
  end
end
