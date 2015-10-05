require "rails_helper"

describe "Erros(page)" do
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
end
