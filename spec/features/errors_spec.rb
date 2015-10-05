require "rails_helper"

describe "Erros(page)" do
  before(:all) do
    Rails.application.config.action_dispatch.show_exceptions = true
    Rails.application.config.consider_all_requests_local = false
  end

  after(:all) do
    Rails.application.config.action_dispatch.show_exceptions = false
    Rails.application.config.consider_all_requests_local = true
  end

  it '404 page' do
    visit '/404'
    expect(page.status_code).to eq 404
    expect(page).to have_content('Увы, но запрашиваемая вами страница ненайдена.')
  end

  it '500 page' do
    visit '/500'
    expect(page.status_code).to eq 500
    expect(page).to have_content('Произошла внутрення ошибка сервера.')
  end

  it 'unreal page' do
    visit '/unreal_page'
    expect(page.status_code).to eq 404
    expect(page).to have_content('Увы, но запрашиваемая вами страница ненайдена.')
  end
end
