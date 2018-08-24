require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'change picture in card' do
  let!(:user)   { create(:user, :with_block_with_card) }

  before do
    visit root_path
    login('test@test.com', '12345', 'Войти')
    visit trainer_path
    expect(current_path).to eq trainer_path
    click_on('Изменить изображение')
  end

  it 'image to flickr_image', :vcr, js: true do
    click_on('Загрузить с Flickr')
    fill_in 'flickr[]', with: 'hello'
    click_on 'Найти'
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

  let!(:user) { create(:user, :with_block_and_card_with_flickr_image) }

  it 'flickr_image to image', :vcr, js: true do

    attach_file("card_image", Rails.root + "spec/support/files/image.png")
    click_on 'Сохранить'

    visit root_path
    visit trainer_path

    within('#image-of-card') do
      page.find(:css,'img[src*="uploads/card/image/image_' + user.cards.first.id.to_s + '"]')
    end
  end
end
