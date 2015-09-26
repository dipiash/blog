require "rails_helper"

describe PostsController do
  let!(:user) { FactoryGirl.create(:user) }

  it "should be login is true" do
    visit '/login'
    expect(page).to have_title('Dipiash | Вход')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '00000000'
    click_on 'Войти'
    expect(page).to have_title('Dipiash | Новости')
    visit '/posts'
    expect(page).to have_title('Dipiash | Список записей')
  end
end
