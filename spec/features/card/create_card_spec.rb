require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'create card' do
  let!(:user) { create(:user, :with_block) }

  it 'add image from flickr and create card', :vcr, js: true do
    visit root_path
    login('test@test.com', '12345', 'Log in')
    visit new_card_path
    expect(current_path).to eq new_card_path

    fill_in 'card[original_text]', with: 'hello'
    fill_in 'card[translated_text]', with: 'здрасть'
    click_on('Загрузить с Flickr')
    fill_in 'flickr[]', with: 'hello'
    click_on 'Найти'
    sleep 2
    first(".flickr_photo").click
    image_source = first(".flickr_photo")[:src]
    click_on 'Выбрать'
    within('#image-of-card') do
      page.find(:css,'img[src*="' + image_source + '"]')
    end
    #flickr working, but spec is not completed
  end
end
