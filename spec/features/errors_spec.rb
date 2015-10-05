require "rails_helper"

describe "Erros(page)" do
  before do
    method = Rails.application.method(:env_config)
    expect(Rails.application).to receive(:env_config).with(no_args()) do
      method.call.merge(
        'action_dispatch.show_exceptions' => true,
        'action_dispatch.show_detailed_exceptions' => false
      )
    end
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
