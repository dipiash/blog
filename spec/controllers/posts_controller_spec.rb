require 'rails_helper'
require "spec_helper"

describe "tt" do
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    visit '/login'
    expect(page).to have_title('Dipiash | Вход')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Войти'
    expect(page).to have_title('Dipiash | Новости')
  end

  it '#new create post and show full' do
    visit 'posts/new'
    expect(page).to have_title('Dipiash | Новая запись')
    fill_in 'Название', with: 'Example title for create'
    fill_in 'Текст записи', with: 'Example content &lt;truncate_text&gt; Example hide text'
    click_on 'Подтвердить'
    expect(page).to  have_title('Dipiash | Example title for create')
    expect(page).to have_content('Example content Example hide text')
  end

  it '#new create post and show preview' do
    visit 'posts/new'
    expect(page).to have_title('Dipiash | Новая запись')
    fill_in 'Название', with: 'Example title for create'
    fill_in 'Текст записи', with: 'Example content &lt;truncate_text&gt; Example hide text'
    click_on 'Подтвердить'
    visit '/'
    expect(page).to  have_title('Dipiash | Новости')
    expect(page).to have_content('Example content ...')
  end

  context 'RSS' do
    it '#rss html format' do
      visit '/rss'
      expect(page).to  have_title('Dipiash | Агрегатор')
    end

    it '#rss rss format' do
      visit '/rss.rss'
      expect(page).to  have_title('Dipiash. Блог о веб разработке и нетолько')
    end

    it '#rss atom format' do
      visit '/rss.atom'
      expect(page).to  have_title('Dipiash. Блог о веб разработке и нетолько')
    end
  end

end
