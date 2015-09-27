require 'rails_helper'

describe PostsHelper do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post, title: "TEST02",
    content: "Yo! &lt;truncate_text&gt; No display text for preview.") }

  before do
    visit '/login'
    expect(page).to have_title('Dipiash | Вход')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Войти'
  end

  it "should have rigth preview" do
    visit "/"
    expect(page).to have_content('Yo! ...')
  end

  it "page for post should have a full content" do
    visit "posts/#{post.id}"
    expect(page).to have_content('Yo! No display text for preview.')
  end
end
