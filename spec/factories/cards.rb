FactoryGirl.define do
  factory :card do
    original_text 'дом'
    translated_text 'house'
    interval 1
    repeat 1
    efactor 2.5
    quality 5
    attempt 1
    user
    block
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
