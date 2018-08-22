require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'change image to flickr image' do
  let!(:user) { create(:user, :with_block_with_card) }

  it 'changes image', :vcr, js: true do
    visit root_path
    login('test@test.com', '12345', 'Войти')
    visit trainer_path
    expect(current_path).to eq trainer_path

    click_on('Изменить изображение')
    click_on('Загрузить с Flickr')
    fill_in 'flickr[]', with: 'hello'
    click_on 'Найти'
    sleep 5
    first(".flickr_photo").click
    image_source = first(".flickr_photo")[:src]
    click_on 'Обновить изображение'
    within('#image-of-card') do
      page.find(:css,'img[src*="' + image_source + '"]')
    end
    click_on 'Сохранить'

    visit root_path
    visit trainer_path
    within('#image-of-card') do
      page.find(:css,'img[src*="' + image_source + '"]')
    end
  end
end

describe 'change flickr image to image' do
  let!(:user) { create(:user, :with_block_and_card_with_flickr_image) }

  it 'changes image', :vcr, js: true do
    visit root_path
    login('test@test.com', '12345', 'Войти')
    visit trainer_path
    expect(current_path).to eq trainer_path

    click_on('Изменить изображение')
    sleep 7
    page.find('#card_image').click
  end
end
