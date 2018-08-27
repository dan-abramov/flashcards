FactoryBot.define do
  factory :card do
    original_text 'дом'
    translated_text 'house'
    interval 1
    repeat 1
    efactor 2.5
    quality 5
    attempt 1
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/image.png'), 'image/png') }
    user
    block
    image_flickr_url nil

    factory :card_with_flickr_url do
      image nil
      image_flickr_url 'http://farm2.static.flickr.com/1786/28640213557_22b5fd957b_s.jpg'
    end
  end

  factory :invalid_card, class: Card do
    original_text 'сломанный дом'
    translated_text 'broken house'
    efactor 2.5
    quality 5
    attempt 1
    user
    block
  end
end
